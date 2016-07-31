class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  skip_before_filter :authenticate_user!

  def index
    @events = Event.where("start_date >= now()").order("start_date")
    @events = @events.where(state: params[:filter_by]) if params[:filter_by]
    @states = State.all.order("swing DESC, name")
    page = params[:page]
    page ||= 1
    @events = @events.paginate(page: page, per_page: 50)
  end

  def show
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

end
