class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :card_number, null: false, unique: true
      t.string :limit_month, null: false
      t.string :limit_year, null: false
      t.string :security_code, null: false
      t.timestamps
    end
  end
end
