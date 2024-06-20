class AddPostRelaxIdToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :post_relax_id, :integer
  end
end
