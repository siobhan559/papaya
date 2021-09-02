class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @profile = User.find(params[:id])
    @event = Event.new
  end
end
