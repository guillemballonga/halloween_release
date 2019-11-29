module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    status_1 = params[:status1]
    status_2 = params[:status2]
    css_class = column == params[:sort] ? 'current' : nil
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    
    
    if params[:sort] == column
      icon_class = column == params[:sort] && params[:direction] == 'asc' ? 'fa fa-sort-up' : 'fa fa-sort-desc'
    else
      icon_class = nil
    end
    
    link_to "#{title} <i class='#{icon_class}'".html_safe, :sort => column, :direction => direction,:status1 => status_1,:status2 => status_2, class: css_class
  end
end