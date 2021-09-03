class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @profile = User.find(params[:id])
    if @profile == current_user
      @past = Event.where('start_time < ?', DateTime.now)
      @upcoming = Event.where('start_time > ?', DateTime.now)
      @event = Event.new if @profile.organization
    end
  end
end
