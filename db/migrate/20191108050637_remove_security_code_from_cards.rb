class RemoveSecurityCodeFromCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :Security_code, :string
  end
end
