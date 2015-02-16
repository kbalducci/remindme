class RemindersController < ApplicationController

    def reminder_params
      params.require(:user).permit(:user_id, :title, :description, :priority)
    end
end
