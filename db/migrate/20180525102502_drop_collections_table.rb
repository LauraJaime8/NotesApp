class DropCollectionsTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :collections
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
