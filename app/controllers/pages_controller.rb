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
        @new_event = Event.new
      else
        # current user's profile page for volunteer
        @upcoming_registered = @profile.registered_events.select { |event| event.start_time > DateTime.now }
        @past_registered = @profile.registered_events.select { |event| event.start_time < DateTime.now }
        @favorites = @profile.all_favorited
        @followings = @profile.following
      end
    else
      @chatroom = Chatroom.includes(%i[owner invitee]).find { |chatroom| chatroom.exist_with?(@profile, current_user) }
      if @profile.organization && current_user.organization
        # visiting an organization's profile page as an organization
        @upcoming_organized = @profile.events.select { |event| event.start_time > DateTime.now }
      elsif @profile.organization
        # visiting an organization's profile page as a volunteer
        @am_following = current_user.following.find { |user| user == @profile }.present?
        @upcoming_organized = @profile.events.select { |event| event.start_time > DateTime.now }
      end
      # visiting a volunteer's profile page
    end
  end
end
