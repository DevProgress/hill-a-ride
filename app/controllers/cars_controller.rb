class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update, :accept]

  def new
    @event = Event.find(params[:id])
    @car = Car.new
    @states = State.all
  end

  def edit
    authorize @car
    @states = State.all
  end

  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    @car.num_of_seats_available = @car.num_of_seats
    if @car.save
      redirect_to event_path(@car.event_id), notice: "Your ride has been created!"
    else
      render :new
    end
  end

  def update
    authorize @car
  end

  def accept
    authorize @car
    ride = RideRequest.find(params[:ride])
    passenger = Passenger.find(ride.passenger_id)

    @car.num_of_seats_available -= ride.num_of_seats_requested
    ride.status = "accepted"
    passenger.seats_still_needed -= ride.num_of_seats_requested

    @car.save if @car.changed?
    ride.save if ride.changed?
    passenger.save if passenger.changed?

    redirect_to rides_path
  end

  private

  def car_params
    params.require(:car).permit(:event_id, :user_id, :address, :city, :state, :zip_code, :latitude, :longitude, :num_of_seats, :num_of_seats_available, :leave, :return)
  end

  def set_car
    @car = Car.find(params[:id])
  end

end
