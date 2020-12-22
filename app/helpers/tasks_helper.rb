module TasksHelper
    def render_tasks
        out = ''
        @tasks.each do |task|
            out << "<div class=\"card w-100\" style=\"max-width: 100%; margin-top: 20px\">
                        <div class=\"space-between card-body\">
                            <div style=\"display: flex\">
                                <div class=\"icon\">
                                    <img src=\"#{task.group.nil? ? 'https://www.spaciousbreath.com/wp-content/uploads/2018/03/Giving-birth-to-Life-1080x608.jpg' : task.group.icon}\" height=\"50\" >
                                </div>
                                <div>
                                    <strong>#{task.name} - #{link_to(task.status ? 'Undone' : 'Done', "/tasks/#{task.id}/toggle", method: :patch )}</strong><br>
                                    <strong class=\"gray\">#{task.description}</strong>
                                </div>
                            </div>
                            <div style=\"text-align: right\">
                                <strong>#{!params[:id].nil? ? task.author.name : (task.group.nil? ? 'General task' : link_to(task.group.name, group_path(task.group_id)))}</strong><br>
                                <strong class=\"gray\">#{task.expiring_date.nil? ? 'Doesn\'t expires' : "#{((task.expiring_date - DateTime.now).to_f * 24).to_i } hours"}</strong>
                            </div>
                        </div>
                    </div>"
        end
        out.html_safe
    end
end
