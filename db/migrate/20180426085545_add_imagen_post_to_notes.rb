class AddImagenPostToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :imagenPost, :string
  end
end
