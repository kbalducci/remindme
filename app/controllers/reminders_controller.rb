class RemindersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
    @reminders = Reminder.all
  end

  def new
    set_user
    set_new_reminder
  end

  def create
      @reminder = Reminder.new(reminder_params)
      user = current_user
      @reminder.user_id = user.id
      respond_to do |format|
        if @reminder.save
          format.html { redirect_to users_path, notice: 'Reminder was successfully created.' }
          format.json { render :show, status: :created, location: @reminder }

        else
          format.html { render :new }
          format.json { render json: @reminder.errors, status: :unprocessable_entity }
        end
      end
  end


  private
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_new_reminder
      @new_reminder = Reminder.new
    end
    def reminder_params
      params.require(:reminder).permit(:user_id, :title, :description, :priority)
    end
    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name)
    end
end
