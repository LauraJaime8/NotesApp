class AddCreateAvatarToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cover_filename, :string
  end
end
