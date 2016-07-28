class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_omniauth_redirect

  def facebook
    connect("Facebook")
  end

  def connect(provider)
    oauth = request.env["omniauth.auth"]
    @user = User.find_for_oauth(oauth)
    if @user
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => provider) if is_navigational_format?
    else
      remember_oauth_data!
      redirect_to oauth_connect_path
    end
  end

  private

  def set_omniauth_redirect
    store_location_for(:user, user_root_path)
  end

  def remember_oauth_data!
    # Store as little data in the session as possible
    data = request.env["omniauth.auth"].clone
    data.keep_if {|k,v| %w{info provider uid credentials}.include?(k)}
    session[:oauth_connect] = data
  end
end