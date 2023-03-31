class ParticipationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @participation = Participation.new
  end

  def create
    # TODO
  end
end
