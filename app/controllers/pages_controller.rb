class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @profile = User.find(params[:id])
    if @profile == current_user
      @upcoming = @profile.registered_events.select { |event| event.start_time > DateTime.now }
      @past = @profile.registered_events.select { |event| event.start_time < DateTime.now }
      @event = Event.new if @profile.organization
    end
  end
end
