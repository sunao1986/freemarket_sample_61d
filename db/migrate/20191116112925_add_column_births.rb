class AddColumnBirths < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birthyear, :string
    add_column :users, :birthmonth, :string
  end
end
