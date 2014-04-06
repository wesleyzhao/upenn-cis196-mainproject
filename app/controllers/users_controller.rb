class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    order_by = params[:order_by]
    order = params[:order]

    # default order is ascending
    if order == "desc"
        @order_str = "DESC"
    else
        @order_str = "ASC"
    end

    if order_by == "name"
        @users = User.all.order("name #{@order_str}")
    else
        # default order, is by name, ascending
        @users = User.all.order("name ASC")
    end

  end

  def show
    @user = User.find(params[:id])
    
    @food_items = FoodItem.where({user_id: @user.id}).order(created_at: :desc).limit(2)

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def delete
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Notifications.new_comment(@user).deliver
      redirect_to users_path
    else
      render 'new'
    end
  end


  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :height_cm, :weight_kg, :activity_level, :body_fat_percent, :weight_kg_goal, :body_fat_percent_goal, :zipcode, :address_street1, :address_street2, :address_city, :address_state, :address_country)
  end

end
