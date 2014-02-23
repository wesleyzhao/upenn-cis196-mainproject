class User < ActiveRecord::Base
  has_many :food_items, :dependent => :destroy
end
