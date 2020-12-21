class GroupsController < ApplicationController
    before_action :user_logged_in, only: [:show]

    def create
        
    end

    def show
        @groups = current_user.groups
        @new_group = current_user.groups.build
    end
end
