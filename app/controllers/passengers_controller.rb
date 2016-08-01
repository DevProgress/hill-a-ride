class PassengersController < ApplicationController
  before_action :set_passenger, only: [:edit, :update]

  def new
    @event = Event.find(params[:id])
    @passenger = Passenger.new
    @states = State.all
  end

  def edit
    authorize @passenger
    @states = State.all
  end

  def create
    @passenger = Passenger.new(passenger_params)
    @passenger.user_id = current_user.id
    @passenger.seats_still_needed = @passenger.seats_requested
    if @passenger.save
      redirect_to event_path(@passenger.event_id), notice: "Your ride request has been created!"
    else
      render :new
    end
  end

  def update
    authorize @passenger
  end

  private

  def passenger_params
    params.require(:passenger).permit(:event_id, :user_id, :city, :state, :zip_code, :latitude, :longitude, :seats_requested, :seats_still_needed, :car_id)
  end

  def set_passenger
    @passenger = Passenger.find(params[:id])
  end

end
