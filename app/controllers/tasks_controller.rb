class TasksController < ApplicationController
    before_action :user_logged_in, only: [:index, :create]

    def index
        @tasks = current_user.tasks.order(created_at: :desc)
        @new_task = current_user.tasks.build
    end

    def general
        @tasks = current_user.tasks.where("group_id IS NULL").order(created_at: :desc)
        @new_task = current_user.tasks.build
    end

    def create
        puts "#{tasks_params}"
        Task.create!(tasks_params)
        if params[:task][:group_id] == ""
            redirect_to tasks_path
        else
            redirect_to group_path(params[:task][:group_id])
        end
    end
    
    private
    
    def tasks_params
        param = params.require(:task).permit(:name, :description, :expiring_date, :group_id)
        param.delete(:group_id) if param[:group_id] == ""
        param[:author_id] = current_user.id
        param
    end
end
