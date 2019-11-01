class AddBrandToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :brand, null: false, foreign_key: true
  end
end