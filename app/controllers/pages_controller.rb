class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def about
  end

  def profile
    @profile = User.find(params[:id])

    # There are 5 different possibilities for a profile page
    # ------------------------------------------------------------------------------
    # Visiting current user's profile page (for volunteer and organization)
    # Visiting a volunteer's profile page
    # Visiting an organization's profile page as (for volunteer and organization)

    if @profile == current_user
      if @profile.organization
        # current user's profile page for organization
        @upcoming_organized = @profile.events.select { |event| event.start_time > DateTime.now }
        @past_organized = @profile.events.select { |event| event.start_time < DateTime.now }
        @event = Event.new
      else
        # current user's profile page for organization
        @upcoming = @profile.registered_events.select { |event| event.start_time > DateTime.now }
        @past = @profile.registered_events.select { |event| event.start_time < DateTime.now }
      end
    else
      @chatroom = Chatroom.includes(%i[owner invitee]).find { |chatroom| chatroom.exist_with?(@profile, current_user) }
      if @profile.organization && current_user.organization
        # visiting an organization's profile page as an organization

      elsif @profile.organization
        # visiting an organization's profile page as a volunteer
        @following = current_user.following.find { |user| user == @profile }.present?

      else
        # visiting an volunteer's profile page

      end
    end
  end
end
