module ApplicationHelper
  def title(title = nil)
    if title.present?
      content_for :title, title
    else
      content_for?(:title) ? APP_CONFIG['default_title'] + ' | ' + content_for(:title) : APP_CONFIG['default_title']
    end
  end

  def meta_keywords(tags = nil)
    if tags.present?
      content_for :meta_keywords, tags
    else
      content_for?(:meta_keywords) ? [content_for(:meta_keywords), APP_CONFIG['meta_keywords']].join(', '): APP_CONFIG['meta_keywords']
    end
  end

  def meta_description(desc = nil)
    if desc.present?
      content_for :meta_description, desc
    else
      content_for?(:meta_description) ? content_for(:meta_description) : APP_CONFIG['meta_description']
    end
  end

  def ajax_flash(div_id)
    response = ""
    flash_div = ""

    flash.each do |name, msg|
      if msg.is_a?(String)
        flash_div = "<div class=\"alert alert-#{name == 'success' ? 'success' : 'danger'} ajax_flash\"><a class=\"close\" data-dismiss=\"alert\">&#215;</a> <div id=\"flash_#{name == 'success' ? 'success' : 'danger'}\">#{h(msg)}</div> </div>"
      end
    end
    response = "$('.ajax_flash').remove();$('#{div_id}').prepend('#{flash_div}');"
    response.html_safe
  end

  def options_for_leave_types
    sub_select = EndOfYear.select(:current_year).where(isactive: true)
    LeaveRecord.joins(:leave_type).where(rec_year: sub_select, employee_id: current_user.id).distinct.order('name ASC').pluck(:name, :leave_type_id)
  end

  def list_colleagues
    Employee.all.map {|employee| [employee.first_last_name, employee.id] if current_user.manager == employee.manager}.compact.delete_if {|emp| emp.first == "#{current_user.first_last_name}"}
  end
end
