class GroupsController < ApplicationController
    before_action :user_logged_in, only: [:show, :index]

    def index
        @user = current_user
        @groups = current_user.groups
        @new_group = current_user.groups.build
    end

    def create
        current_user.groups.create!(group_params)
        redirect_to app_path
    end
    
    def show
        @group = Group.find(params[:id])
        @new_task = current_user.tasks.build
    end

    private
    
    def group_params
        params.require(:group).permit(:name, :icon)
    end
end
