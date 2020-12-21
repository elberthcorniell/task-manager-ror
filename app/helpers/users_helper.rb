module UsersHelper
    def logout_btn 
        return "<li class=\"nav-item\">
            #{link_to("Log out", logout_path, method: :delete, class: "nav-link")}
        </li>".html_safe if !session[:user_id].nil?
    end
end
