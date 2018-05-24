class RemoveDestroyFromFriendRequest < ActiveRecord::Migration[5.1]
  def change
    remove_column :friend_requests, :destroy, :string
  end
end
