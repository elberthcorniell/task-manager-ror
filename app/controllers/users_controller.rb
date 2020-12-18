class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by_name(params[:user][:name])
        if @user.nil?
            # create account
            @user = User.create!(user_create)
        else
            # log in
            puts 'Login in'
        end
        session[:user_id] = @user.id
    end

end
