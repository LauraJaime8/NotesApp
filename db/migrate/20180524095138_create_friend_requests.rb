class CreateFriendRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_requests do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end
