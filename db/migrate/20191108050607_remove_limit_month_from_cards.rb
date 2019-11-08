class RemoveLimitMonthFromCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :Limit_month, :string
  end
end
