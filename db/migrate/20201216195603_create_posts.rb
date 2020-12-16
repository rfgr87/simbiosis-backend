class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :text
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :theme, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
