class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.text :body
      t.datetime :start_time

      t.timestamps
    end
  end
end
