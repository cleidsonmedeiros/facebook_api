class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :desc
      t.string :images

      t.timestamps
    end
  end
end
