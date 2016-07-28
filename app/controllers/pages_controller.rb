class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  def home
    redirect_to user_root_path if current_user
  end

  def yes
  end

  def no
  end
end
