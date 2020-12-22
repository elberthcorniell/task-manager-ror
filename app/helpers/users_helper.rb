module UsersHelper
  def logout_btn
    unless session[:user_id].nil?
      "<li class=\"nav-item\">
              #{link_to('Log out', logout_path, method: :delete, class: 'nav-link')}
          </li>".html_safe
    end
  end

  def login_err
    out = ''
    flash[:error]&.each do |error|
      out << "<strong style=\"color: red\">#{error}</strong><br>"
    end
    out.html_safe
  end
end
