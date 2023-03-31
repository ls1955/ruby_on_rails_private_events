class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @events = Event.all
  end

  def show
    @event = Event.find params[:id]
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build event_params

    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    @event = Event.find params[:id]

    if @event.update event_params
      redirect_to event_path(@event), notice: "Event has been successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to root_path, notice: "Event has been successfully deleted."
  end

  private

  def event_params
    params.require(:event).permit(:date, :location)
  end
end
