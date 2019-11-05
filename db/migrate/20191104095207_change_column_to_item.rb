class ChangeColumnToItem < ActiveRecord::Migration[5.0]
  # 変更内容
  def up
    change_column :items, :likes_count, :integer, null: true
    change_column :items, :buyer_id, :integer, null: true
    change_column :items, :condition, :integer, null: true
  end

  # 変更前の状態
  def down
    change_column :items, :likes_count, :integer, null: false
    change_column :items, :buyer_id, :integer, null: false
    change_column :items, :condition, :integer, null: false
  end
end
