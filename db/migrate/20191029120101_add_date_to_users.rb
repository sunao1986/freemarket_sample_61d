class AddDateToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_kana, :string
    add_column :users, :last_kana, :string
    add_column :users, :birthday, :string
    add_column :users, :phone_number, :string
    add_column :users, :introduction, :text
    add_column :users, :postal_code, :string
    add_column :users, :prefectures, :string
    add_column :users, :adress, :string
    add_column :users, :building, :string
  end
end
