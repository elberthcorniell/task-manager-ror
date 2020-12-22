module TasksHelper
  def render_tasks(title = nil)
    out = ''
    prev = 'no prev'
    flash[:error]&.each do |error|
      out << "<strong style=\"color: red\">#{error}</strong><br>"
    end
    @tasks.each do |task|
      if task.group_id != prev && !title
        prev = task.group_id
        out << "<br><strong>#{task.group ? task.group.name : 'General'}</strong>
                        <hr>"
      end
      out << "<div class=\"card w-100\" style=\"max-width: 100%; margin-top: 20px\">
                        <div class=\"space-between card-body\">
                            <div style=\"display: flex\">
                                <div class=\"icon\">
                                    <img src=\"#{task.group.nil? ? 'https://www.spaciousbreath.com/wp-content/uploads/2018/03/Giving-birth-to-Life-1080x608.jpg' : task.group.icon}\" height=\"50\" >
                                </div>
                                <div>
                                    <strong>#{task.name} - #{link_to(task.status ? 'Undone' : 'Done',
                                                                     "/tasks/#{task.id}/toggle", method: :patch)}</strong><br>
                                    <strong class=\"gray\">#{task.description}</strong>
                                </div>
                            </div>
                            <div style=\"text-align: right\">
                                <strong>#{if !params[:id].nil?
                                            task.author.name
                                          else
                                            (if task.group.nil?
                                               'General task'
                                             else
                                               link_to(
                                                 task.group.name, group_path(task.group_id)
                                               )
                                             end)
                                          end}</strong><br>
                                <strong class=\"gray\">#{task.expiring_date.nil? ? 'Doesn\'t expires' : "#{((task.expiring_date - DateTime.now).to_f * 24).to_i} hours"}</strong>
                            </div>
                        </div>
                    </div>"
    end
    out.html_safe
  end
end
