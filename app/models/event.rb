class Event < ApplicationRecord
  def display_address
    text = ""
    text = text + self.address_1 + ' ' if self.address_1  and self.address_1 != " "
    text = text + self.address_2 if self.address_2  and self.address_2 != " "
    text = text + self.city + ', ' + self.state + ' ' + self.zip_code
  end
end
