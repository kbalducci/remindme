class UsersController < ApplicationController
protect_from_forgery with: :exception

def index
  @user = User.first
  @reminders = Reminder.all

end

def new
  @user = User.new
  @reminder = Reminder.new
end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name)
    end

end
