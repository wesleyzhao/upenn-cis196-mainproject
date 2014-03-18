class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_devise_permitted_parameters
    registration_params = [:name, :email, :password, :password_confirmation,:height_cm, :weight_kg, :activity_level, :body_fat_percent, :weight_kg_goal, :body_fat_percent_goal, :zipcode, :address_street1, :address_street2, :address_city, :address_state, :address_country]
    if params[:action] == "update"
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == "create"
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end


end
