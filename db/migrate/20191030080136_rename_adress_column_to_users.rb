class RenameAdressColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :adress, :address
  end
end
