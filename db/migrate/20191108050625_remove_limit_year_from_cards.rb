class RemoveLimitYearFromCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :Limit_year, :string
  end
end
