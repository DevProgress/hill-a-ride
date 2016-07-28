class UsersController < ApplicationController

  skip_before_filter :authenticate_user!

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
  end

  def update
    parameters = user_params
    current_user.update_attributes(parameters)
    flash[:success] = "Your profile has been updated! Hooray!"
    redirect_to user_root_path
  end

  def friends
    @friends = FacebookFriend.where(user_id: current_user.id)
    @friends = @friends.joins("LEFT JOIN users on facebook_friends.friend_user_id = users.id").select("facebook_friends.friend_name, users.city, users.state")
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :city, :state)
  end

end
