class CreatePostRelaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_relaxes do |t|
      t.string :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
