class ChangeIsConditionDefaultOnItems < ActiveRecord::Migration[5.0]
  def change
    change_column_default :items, :condition, from: nil, to: 0
  end
end
