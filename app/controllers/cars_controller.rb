class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update]

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

  private

  def car_params
    params.require(:car).permit(:event_id, :user_id, :address, :city, :state, :zip_code, :latitude, :longitude, :num_of_seats, :num_of_seats_available, :leave, :return)
  end

  def set_car
    @car = Car.find(params[:id])
  end

end
