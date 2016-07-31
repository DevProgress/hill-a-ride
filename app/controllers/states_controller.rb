class StatesController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @states = State.all.order("swing DESC")
  end
end
