class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  # def is_authorized?
  #   if current_user.id != params[:user_id].to_i
  #     flash[:alert] = "You are not authorized to see that page."
  #     redirect_to root_path
  # end

  # def show
  #   if is_authorized?
  #     @reminder = Reminder.find(params[:user_id])
  #   else
  #     flash[:alert] = "You are not authorized to see that page."
  #     redirect_to root_path
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name, :user_name)
  end

end
