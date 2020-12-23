class UsersController < ApplicationController
  before_action :user_logged_in, only: [:show]

  def new
    redirect_to app_path if current_user
    @user = User.new
  end

  def create
    @user = User.find_by_name(params[:user][:name])
    if @user.nil?
      @user = User.create(user_create)
      if @user.errors.any?
        flash[:error] = @user.errors.full_messages
        redirect_to login_path
        return
      end
    end
    session[:user_id] = @user.id
    redirect_to app_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def user_create
    params.require(:user).permit(:name)
  end
end
