class ApplicationController < ActionController::Base
  def user_create
    params.require(:user).permit(:name)
  end

  def tasks_params
    param = params.require(:task).permit(:name, :description, :expiring_date, :group_id)
    param.delete(:group_id) if param[:group_id] == ''
    param[:author_id] = current_user.id
    param
  end

  def current_user
    return nil if session[:user_id].nil?

    begin
      User.find(session[:user_id])
    rescue StandardError
      nil
    end
  end

  def user_logged_in
    if current_user
      true
    else
      redirect_to login_path
      false
    end
  end
end
