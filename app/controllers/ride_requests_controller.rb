class RideRequestsController < ApplicationController
  def new
    @car = Car.find(params[:car])
    @driver = User.find(@car.user_id)
    @event = Event.find(@car.event_id)
    @ride_request = RideRequest.new
  end

  def create
    @ride_request = RideRequest.new(ride_request_params)
    car = Car.find(@ride_request.car_id)
    passenger = Passenger.where(user_id: current_user.id, event_id: car.event_id).first_or_initialize
    if passenger.new_record?
      passenger.seats_requested = @ride_request.num_of_seats_requested
      passenger.seats_still_needed = @ride_request.num_of_seats_requested
      passenger.city = current_user.city
      passenger.state = current_user.state
      passenger.zip_code = current_user.zip_code
      passenger.save
    end
    @ride_request.passenger_id = passenger.id
    if @ride_request.save
      redirect_to event_path(car.event_id), notice: "Your ride request has been submitted!"
    else
      render :new
    end
  end

  private

  def ride_request_params
    params.require(:ride_request).permit(:car_id, :passenger_id, :num_of_seats_requested, :note)
  end

  def set_ride_request
    @ride_request = RideRequest.find(params[:id])
  end
end
