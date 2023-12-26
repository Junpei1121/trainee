class PostFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  #同一ユーザーが同一投稿に何度もいいねできないようにする
  validates :user_id, uniqueness: {scope: :post_id}
end
