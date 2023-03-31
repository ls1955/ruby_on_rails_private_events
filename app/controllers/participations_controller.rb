class ParticipationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @participation = Participation.new
  end

  def create
    @participation = Participation.new participation_params

    if @participation.save
      redirect_to new_participation_path, notice: "User has been successfully invited."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    Participation.find(params[:id]).destroy
    redirect_to user_path(current_user), notice: "Attendance has been successfully deleted."
  end

  private

  def participation_params
    params.require(:participation).permit(:attendee_id, :attended_event_id  )
  end
end
