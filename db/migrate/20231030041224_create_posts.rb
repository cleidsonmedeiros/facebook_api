class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :desc
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
