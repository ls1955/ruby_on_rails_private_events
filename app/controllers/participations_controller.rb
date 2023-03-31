class ParticipationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @participation = Participation.new
  end

  def create
    @event = Event.find_by partipation_params

    if current_user.attended_events << @event
      redirect_to event_path(@event), notice: "You have successfully attend this event."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def partipation_params
    params.require(:participation).permit(:id)
  end
end
