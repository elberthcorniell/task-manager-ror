module UsersHelper
  def logout_btn
    out = "<li class=\"nav-item\">
                  #{link_to('Log out', logout_path, method: :delete, class: 'nav-link')}
              </li>".html_safe
    return out if session[:user_id].nil?
  end

  def login_err
    out = ''
    flash[:error]&.each do |error|
      out << "<strong style=\"color: red\">#{error}</strong><br>"
    end
    out.html_safe
  end
end
