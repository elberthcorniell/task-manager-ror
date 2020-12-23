# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/BlockLength
# rubocop:disable Metrics/CyclomaticComplexity

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
                          <strong class=\"gray\">#{if task.expiring_date.nil?
                                                     'Doesn\'t expires'
                                                   else
                                                     "#{task.expiring_date.strftime("%-d/%-m/%y - %H:%M")} (#{((task.expiring_date - Time.now).to_f / 3600).to_i} hours)"
                                                   end}</strong>
                        </div>
                        </div>
                        </div>"
    end
    out.html_safe
  end
end

# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/BlockLength
# rubocop:enable Metrics/CyclomaticComplexity
