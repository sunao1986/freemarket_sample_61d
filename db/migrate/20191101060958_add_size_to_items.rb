class AddSizeToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :size, null: false, foreign_key: true
  end
end