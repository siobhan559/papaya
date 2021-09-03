class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @event = Event.new
    @profile = User.find(params[:id])

    if @profile == current_user
      if @profile.organization
      else
        @past = Event.where('start_time < ?', DateTime.now)
        @upcoming = Event.where('start_time > ?', DateTime.now)
      end
    else
      # @chatroom = Chatroom.new
      if @profile.organization
      else
      end
    end
  end
end
