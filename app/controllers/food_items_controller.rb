class FoodItemsController < ApplicationController
  def index
    @food_items = FoodItem.all
  end

  def new
    @food_item = FoodItem.new
  end

  def edit
  end

  def show
  end

  def create
    @food_item = FoodItem.new(food_item_params)
    if @food_item.save
      redirect_to food_items_path
    else
      render 'new'
    end
  end

  private
  def food_item_params
    params.require(:food_item).permit(:name, :calories, :protein, :carbs, :fat, :description, :user_id)
  end

end
