class CreateShippings < ActiveRecord::Migration[5.0]
  def change
    create_table :shippings do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_kana, null: false
      t.string :last_kana, null: false
      t.string :postal_code, null: false
      t.string :prefectures, null: false
      t.string :city, null: false
      t.string :adress, null: false
      t.string :building
      t.string :phone_number
      t.timestamps
    end
  end
end
