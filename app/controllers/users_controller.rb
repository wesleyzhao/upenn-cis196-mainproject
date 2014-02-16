class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def edit
  end

  def delete
  end

  def create
    @user = User.new(user_params)
    if @user.save
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
