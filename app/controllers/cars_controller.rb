class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update, :accept]

  def index
    @cars = Car.all
    @cars = @cars.where(state: params[:departure_state]) if params[:departure_state]
    @cars = @cars.where(destination_state: params[:destination_state]) if params[:destination_state]
    page = params[:page]
    page ||= 1
    @cars = @cars.paginate(page: page, per_page: 50)
    @cars = @cars.joins("LEFT JOIN users on user_id = users.id")
    @states = State.all
  end

  def new
    @event = Event.find(params[:id]) if params[:id]
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
    @car.leave = DateTime.parse(params[:car][:leave], "%m/%d/%Y %I:%M %p").getutc
    @car.return = DateTime.parse(params[:car][:return], "%m/%d/%Y %I:%M %p").getutc if params[:car][:return]
    if @car.event_id
      event = Event.find(@car.event_id)
      @car.destination_address = event.address_1
      @car.destination_city = event.city
      @car.destination_state = event.state
      @car.destination_zip_code = event.zip_code
    end
    if @car.save
      if @car.event_id
        redirect_to event_path(@car.event_id), notice: "Your ride has been created!"
      else
        redirect_to user_rides_path, notice: "Your ride has been created!"
      end
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

    redirect_to user_rides_path
  end

  private

  def car_params
    params.require(:car).permit(:event_id, :user_id, :address, :city, :state, :zip_code, :latitude, :longitude, :num_of_seats, :num_of_seats_available, :leave, :return, :destination_address, :destination_city, :destination_state, :destination_zip_code)
  end

  def set_car
    @car = Car.find(params[:id])
  end

end
