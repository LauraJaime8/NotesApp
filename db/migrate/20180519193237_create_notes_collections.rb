class CreateNotesCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.timestamps
    end

    create_table :notes do |t|
      t.string :title
      t.string :body
      t.timestamps
    end

    create_table :notes_collections, :id => false do |t|
      t.references :note, index: true, foreign_key: true
      t.references :collection, index: true, foreign_key: true
    end
  end
end
