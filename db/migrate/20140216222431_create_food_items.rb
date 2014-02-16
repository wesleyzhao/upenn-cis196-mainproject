class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.text :description
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
