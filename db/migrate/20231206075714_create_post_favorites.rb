class CreatePostFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :post_favorites do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
