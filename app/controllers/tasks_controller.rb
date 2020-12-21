class TasksController < ApplicationController
    before_action :user_logged_in, only: [:index, :create]

    def index

    end

    def create
        current_user.tasks.create!(tasks_params)
        redirect_to group_path(params[:task][:group_id])
    end
    
    private
    
    def tasks_params
        params.require(:task).permit(:name, :description, :expiring_date, :group_id)
    end
end
