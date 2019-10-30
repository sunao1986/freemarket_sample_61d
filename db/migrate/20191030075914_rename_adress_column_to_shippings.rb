class RenameAdressColumnToShippings < ActiveRecord::Migration[5.0]
  def change
    rename_column :shippings, :adress, :address
  end
end
