class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  validates :body, length: { minimum: 2, maximum: 300 },  presence: true
  
  # 画像を投稿に追加できるし、ない場合はそのまま投稿できる
  def get_image(width, height)
    if image.attached?
      image.variant(resize_to_limit: [width, height]).processed
    else
      nil
    end
  end
  # タグ付け機能についての記述
  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(name: new_name)
      self.tags << tag
    end
  end
  
  # いいねについての記述
  def post_favorited_by?(user)
    post_favorites.exists?(user_id: user.id)
  end
  
  # 検索機能のためのメソッド
  def self.looks(search, word)
    if search == "partial_match"
      @post = Post.where("body LIKE?", "%#{word}%")
    end
  end
  
end
