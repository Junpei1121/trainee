class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  validates :name, presence:true, length:{maximum:20}
  
  # 検索機能のためのメソッド
  def self.looks(search, word)
    if search == "partial_match"
      @tag = Tag.where("name LIKE?", "%#{word}%")
    end
  end
end
