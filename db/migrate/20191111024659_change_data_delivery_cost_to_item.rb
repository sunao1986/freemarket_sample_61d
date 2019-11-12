class ChangeDataDeliveryCostToItem < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :delivery_cost, :string
  end
end
