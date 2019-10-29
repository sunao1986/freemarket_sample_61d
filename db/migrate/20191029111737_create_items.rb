class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :discription, null: false
      t.string :status, null: false
      t.integer :delivery_cost, null: false
      t.string :delivery_method, null: false
      t.string :delivery_area, null: false
      t.string :delivery_days, null: false
      t.integer :price, null: false
      t.integer :likes_count, null: false
      t.integer :buyer_id, null: false
      t.string :condition, null: false
      t.timestamps
    end
  end
end
