class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
  end

  private

  def event_params
    params.require(:event).permit(:date, :location)
  end
end
