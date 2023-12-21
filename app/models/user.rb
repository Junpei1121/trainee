class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  validates :name, length: { minimum: 2, maximum: 20 },  presence: true
  validates :introduction, length: { maximum: 50 }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  #通知機能に関する記述
  has_many :notifications, dependent: :destroy
  # フォロー機能についての記述
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_users, through: :followers, source: :followed
  has_many :follower_users, through: :followeds, source: :follower
  # フォローする
  def follow(user_id)
    followers.create(followed_id: user_id)
  end
  # フォロー外す
  def unfollow(user_id)
    followers.find_by(followed_id: user_id).destroy
  end
  #フォローしていればtrueを返す
  def following?(user)
    following_users.include?(user)
  end

  # 検索機能のためのメソッド
  def self.looks(search, word)
    if search == "partial_match"
      @user = User.where("name LIKE?", "%#{word}%")
    end
  end
  # ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないようにする
  def active_for_authentication?
    super && (is_active == true)
  end
  #ゲストログイン
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  # プロフィール写真を追加したらその画像を使用し、追加されなかったらデフォルトの画像
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
