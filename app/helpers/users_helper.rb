module UsersHelper
  def car_rides(car_id)
    RideRequest.where(car_id: car_id)
  end
end
