class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def about
  end

  def profile
    @profile = User.find(params[:id])
    if @profile == current_user
      if @profile.organization
        @upcoming_organized = @profile.events.select { |event| event.start_time > DateTime.now }
        @past_organized = @profile.events.select { |event| event.start_time < DateTime.now }
        @event = Event.new
      else
        @upcoming = @profile.registered_events.select { |event| event.start_time > DateTime.now }
        @past = @profile.registered_events.select { |event| event.start_time < DateTime.now }
      end
    else
      @chatroom = Chatroom.includes(%i[owner invitee]).find { |chatroom| chatroom.exist_with?(@profile, current_user) }
      @following = current_user.following.find { |user| user == @profile }.present?
    end
  end
end
