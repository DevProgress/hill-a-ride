class StatesController < ApplicationController
  def index
    @states = State.all.order("swing DESC")
  end
end
