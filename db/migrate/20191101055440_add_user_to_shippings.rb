class AddUserToShippings < ActiveRecord::Migration[5.0]
  def change
    add_reference :shippings, :user, null: false, foreign_key: true
  end
end
