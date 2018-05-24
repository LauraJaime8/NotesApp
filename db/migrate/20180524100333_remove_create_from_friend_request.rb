class RemoveCreateFromFriendRequest < ActiveRecord::Migration[5.1]
  def change
    remove_column :friend_requests, :create, :string
  end
end
