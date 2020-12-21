module GroupsHelper
    def render_groups
        out = ""
        @groups.each do |group|
            out << "<div class=\"card w-100 h-100\">
                        <img src=\"#{group.icon}\" onerror=\"if (this.src != 'error.jpg') this.src = 'error.jpg';\" class=\"card-img-top\" alt=\"...\">
                        <div class=\"card-title\">
                            <h2>#{group.title}</h2>
                        </div>
                    </div>"
        end
        out.html_safe
    end
end
