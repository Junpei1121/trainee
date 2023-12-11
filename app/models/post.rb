class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  validates :body, length: { minimum: 2, maximum: 300 },  presence: true
  
  # 画像を投稿に追加できるし、ない場合はそのまま投稿できる
  def get_image(width, height)
    if image.attached?
      image.variant(resize_to_limit: [width, height]).processed
    else
      nil
    end
  end
  
  # いいねを
  def post_favorited_by?(user)
    post_favorites.exists?(user_id: user.id)
  end
  
end
