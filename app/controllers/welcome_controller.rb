class WelcomeController < ApplicationController

  def index
    @user = User.first
    @reminders = Reminder.all
    @users = User.all
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name)
    end

    def reminder_params
      params.require(:user).permit(:user_id, :title, :description, :priority)
    end
end
