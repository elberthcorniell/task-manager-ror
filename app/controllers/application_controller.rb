class ApplicationController < ActionController::Base
    def user_create
        params.require(:user).permit(:name)
    end

    def current_user
        return nil if session[:user_id].nil?
        begin
            User.find(session[:user_id])
        rescue
            return nil
        end 
    end

    def user_logged_in
        if current_user
            return true
        else
            redirect_to login_path
            return false
        end
    end

end
