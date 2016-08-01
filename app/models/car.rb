class Car < ApplicationRecord
  belongs_to :user
  belongs_to :event

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address, city, state, zip_code].compact.join(" ")
  end

end
