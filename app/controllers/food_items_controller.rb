class FoodItemsController < ApplicationController
  def index
    @food_items = FoodItem.all
  end

  def new
    @food_item = FoodItem.new
  end

  def show
    @food_item = FoodItem.find(params[:id])
  end

  def edit
    @food_item = FoodItem.find(params[:id])
  end

  def update
    @food_item = FoodItem.find(params[:id])
    if @food_item.update_attributes(food_item_params)
      redirect_to food_item_path(@food_item.id)
    else
      render 'edit'
    end
  end

  def delete
  end

  def destroy
    @food_item = FoodItem.find(params[:id])
    @food_item.destroy
    redirect_to food_items_path
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
