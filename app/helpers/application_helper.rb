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

  def list_of_states
    [["Alabama", "AL"], ["Alaska", "AK"], ["Arizona", "AZ"], ["Arkansas", "AR"], ["California", "CA"], ["Colorado", "CO"], ["Connecticut", "CT"], ["Delaware", "DE"], ["Florida", "FL"], ["Georgia", "GA"], ["Hawaii", "HI"], ["Idaho", "ID"], ["Illinois", "IL"], ["Indiana", "IN"], ["Iowa", "IA"], ["Kansas", "KS"], ["Kentucky", "KY"], ["Louisiana", "LA"], ["Maine", "ME"], ["Maryland", "MD"], ["Massachusetts", "MA"], ["Michigan", "MI"], ["Minnesota", "MN"], ["Mississippi", "MS"], ["Missouri", "MO"], ["Montana", "MT"], ["Nebraska", "NE"], ["Nevada", "NV"], ["New Hampshire", "NH"], ["New Jersey", "NJ"], ["New Mexico", "NM"], ["New York", "NY"], ["North Carolina", "NC"], ["North Dakota", "ND"], ["Ohio", "OH"], ["Oklahoma", "OK"], ["Oregon", "OR"], ["Pennsylvania", "PA"], ["Rhode Island", "RI"], ["South Carolina", "SC"], ["South Dakota", "SD"], ["Tennessee", "TN"], ["Texas", "TX"], ["Utah", "UT"], ["Vermont", "VT"], ["Virginia", "VA"], ["Washington", "WA"], ["Washington D.C.", "DC"], ["West Virginia", "WV"], ["Wisconsin", "WI"], ["Wyoming", "WY"]]
  end
  
end
