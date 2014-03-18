class FoodItem < ActiveRecord::Base
  belongs_to :user
  
  validates :name, presence: true
  
  # any valid integer
  nutritionNumValidation = /\A(0)|([1-9]\d*)\z/
  
  validates :calories, format: {with: nutritionNumValidation, message: "must be a valid number"}

  validates :protein, format: {with: nutritionNumValidation, message: "must be a valid number"}

  validates :carbs, format: {with: nutritionNumValidation, message: "must be a valid number", :allow_blank => false}

  validates :fat, format: {with: nutritionNumValidation, message: "must be a valid number"}
end
