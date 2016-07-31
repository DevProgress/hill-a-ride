class HillaryApi
  include HTTParty
  base_uri "https://www.hillaryclinton.com/api"
  headers "Content-Type" => "application/json"

  def events(page=1)
    self.class.get("/events/events?page=#{page}&perPage=100&status=confirmed&visibility=public")
  end

  def pull_all_events(starting_page = 1)
    data = self.events
    pages = data["meta"]["totalPages"]
    i = starting_page
    while i <= pages
      data = self.events(i)
      data["events"].each do |event_info|
        event = Event.where(id: event_info["id"]).first_or_initialize
        event.name = event_info["name"]
        event.description = event_info["description"]
        event.start_date = event_info["startDate"]
        event.end_date = event_info["endDate"]
        if event_info["locations"] and event_info["locations"][0]
          event.address_1 = event_info["locations"][0]["address1"]
          event.address_2 = event_info["locations"][0]["address2"]
          event.city = event_info["locations"][0]["city"]
          event.state = event_info["locations"][0]["state"]
          event.zip_code = event_info["locations"][0]["postalCode"]
          event.latitude = event_info["locations"][0]["latitude"]
          event.longitude = event_info["locations"][0]["longitude"]
        end
        event.save if event.changed? or event.new_record?
      end
      i+=1
    end

  end


end