class UsersController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:oauth_create, :oauth_connect]

  def oauth_create
    @user = User.where(facebook_id: session[:oauth_connect]["uid"]).first_or_initialize
    @user.attributes = user_params
    result = @user.set_oauth_data!(session[:oauth_connect])
    if result
      flash[:notice] = "You have successfully connected with #{session[:oauth_connect]["provider"].to_s.humanize.titleize}."
      session[:oauth_connect].clear
      sign_in_and_redirect @user, :event => :authentication
    else
      render :oauth_connect
    end
  end

  def oauth_connect
    redirect_to user_root_path if current_user
    redirect_to root_path and return unless session[:oauth_connect].present?
    user = User.where(facebook_id: session[:oauth_connect]["uid"]).first_or_initialize
    user.set_oauth_data!(session[:oauth_connect])
    sign_in_and_redirect user, :event => :authentication
  end

  def edit
    @states = State.all
  end

  def update
    parameters = user_params
    current_user.update_attributes(parameters)
    flash[:success] = "Your profile has been updated! Hooray!"
    redirect_to user_root_path
  end

  def friends
    if current_user and (current_user.city.nil? or current_user.state.nil? or current_user.registered.nil?)
      flash[:danger] = "Your profile is incomplete. #{view_context.link_to('Update it', account_path)} now!"
    end
    @friends = FacebookFriend.where(user_id: current_user.id)
    @friends = @friends.joins("LEFT JOIN users on facebook_friends.friend_user_id = users.id").joins("LEFT JOIN states on users.state = states.abbreviation").select("users.name, users.state, users.registered, states.swing").order("swing DESC")
  end

  def rides
    @cars = Car.where(user_id: current_user.id).joins("LEFT JOIN events on event_id = events.id").select("events.name as event_name, events.city as event_city, events.state as event_state, cars.num_of_seats, cars.num_of_seats_available, cars.id")
    @ride_requests = RideRequest.where(car_id: @cars.ids)
    @passengers = Passenger.where(user_id: current_user.id).joins("LEFT JOIN events on event_id = events.id").select("events.name as event_name, events.city as event_city, events.state as event_state")
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :address_1, :city, :state, :registered)
  end

end
