module ApplicationHelper

  def body_classes
    classes = ["AreYouWithHer"]
    classes << "#{params[:controller]}-#{params[:action]}".parameterize.gsub("_", "-")
    classes += @extra_body_classes if @extra_body_classes and @extra_body_classes.any?
    classes.join(" ")
  end

  def set_page_title(title = "#LoveTrumpsHate")
    @page_title = capture {"AreYouWithHer? - #{title}"}
  end

  def filter_parameters(options = {})
    {filter: params[:filter], query: params[:query], sort_by: params[:sort_by]}.merge(options)
  end

  def datetime_format(datetime)
    if datetime
      local_time(datetime, format: '%b %e, %l:%M %p %Z')
    else
      nil
    end
  end

  def yes_no(boolean)
    if boolean == 1
      "Yes"
    elsif boolean == 0
      "No"
    else
      nil
    end
  end
  
end
