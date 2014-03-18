class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :food_items, :dependent => :destroy

  integerValidation = /\A\d+\z/
  floatValidation = /\A(\d*[.])?\d+\z/

  validates :height_cm, format: {with: floatValidation, message: "must be a valid number"}
  validates :weight_kg, format: {with: floatValidation, message: "must be a valid number"}
  validates :body_fat_percent, format: {with: floatValidation, message: "must be a valid number"}
  validates :weight_kg_goal, format: {with: floatValidation, message: "must be a valid number"}
  validates :body_fat_percent_goal, format: {with: floatValidation, message: "must be a valid number"}
end
