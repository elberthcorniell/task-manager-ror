class ApplicationController < ActionController::Base
    def user_create
        params.require(:user).permit(:name)
    end

    def current_user
        session[:user_id]
    end
end
