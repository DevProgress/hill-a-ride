class RideRequest < ApplicationRecord
  belongs_to :passenger
  belongs_to :user

  enum status: [:pending, :accepted, :full]
end
