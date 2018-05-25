class DeleteCreateFriendships < ActiveRecord::Migration[5.1]
  def change_table
    remove_column :friendships, :create, :string
    remove_column :friendships, :destroy, :string
  end
end
