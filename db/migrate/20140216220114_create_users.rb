class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.float :height_cm
      t.float :weight_kg
      t.string :activity_level
      t.float :body_fat_percent
      t.float :weight_kg_goal
      t.float :body_fat_percent_goal
      t.integer :zipcode
      t.string :address_street1
      t.string :address_street2
      t.string :address_city
      t.string :address_state
      t.string :address_country

      t.timestamps
    end
  end
end
