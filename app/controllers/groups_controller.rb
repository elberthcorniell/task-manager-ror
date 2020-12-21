class GroupsController < ApplicationController
    before_action :user_logged_in, only: [:show]

    def create
        current_user.groups.create!(group_params)
        @groups = current_user.groups
        @new_group = current_user.groups.build
        redirect_to app_path
    end
    
    def show
        @user = current_user
        @groups = current_user.groups
        @new_group = current_user.groups.build
    end

    private
    
    def group_params
        params.require(:group).permit(:name, :icon)
    end
end
