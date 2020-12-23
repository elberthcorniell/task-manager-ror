class ApplicationController < ActionController::Base
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
