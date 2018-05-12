class ChangeTableCollection < ActiveRecord::Migration[5.1]
  change_table :collections do |t|
    t.string :title
    t.string :description

    t.timestamps
  end
end
