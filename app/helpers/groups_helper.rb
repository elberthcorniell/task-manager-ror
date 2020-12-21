module GroupsHelper
    def render_groups
        out = ""
        @groups.each do |group|
            out << "<div class=\"col-3\">
                        <a href=\"#{group_path(group.id)}\">
                            <div class=\"card w-100 h-100\">
                                <div class=\"image-setter\">
                                    <img src=\"#{group.icon}\" class=\"card-img-top\" alt=\"...\"  onerror=\"this.onerror=null;this.src='/assets/error.jpg';\">
                                </div>
                                <div class=\"card-body\">
                                    <h2><strong>#{group.name}</strong></h2>
                                </div>
                            </div>
                        </a>
                    </div>"
        end
        out.html_safe
    end

end
