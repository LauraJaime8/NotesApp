class DropFriendshipTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :friendships
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
