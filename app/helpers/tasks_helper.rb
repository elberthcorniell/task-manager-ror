module TasksHelper
    def render_tasks
        out = ''
        @tasks.each do |task|
            out << "<div class=\"card w-100\" style=\"max-width: 100%; margin-top: 20px\">
                        <div class=\"space-between card-body\">
                            <div style=\"display: flex\">
                                <div class=\"icon\">
                                    <img src=\"#{task.group.icon}\" height=\"50\" >
                                </div>
                                <div>
                                    <strong>#{task.name}</strong><br>
                                    <strong class=\"gray\">#{task.description}</strong>
                                </div>
                            </div>
                            <div>
                                <strong class=\"gray\">#{task.expiring_date.nil? ? 'Doesn\'t expires' : task.expiring_date}</strong>
                            </div>
                        </div>
                    </div>"
        end
        out.html_safe
    end
end
