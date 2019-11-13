class CreateSnsCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :sns_credentials do |t|
      t.string :uid
      t.string :provider
      t.integer :user_id

      t.timestamps
    end
  end
end
