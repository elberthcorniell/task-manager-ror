class UsersController < ApplicationController
    before_action :user_logged_in, only: [:show]

    def new
        redirect_to app_path if current_user
        @user = User.new
    end

    def create
        @user = User.find_by_name(params[:user][:name])
        @user = User.create!(user_create) if @user.nil?
        session[:user_id] = @user.id
        redirect_to app_path
    end

    def show
        
    end

    def destroy
        session[:user_id] = nil
        redirect_to login_path
    end
    
end
