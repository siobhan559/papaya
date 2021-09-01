class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @event = Event.find(params[:event_id])
    @booking.user = current_user
    @booking.event = @event
    if @booking.save
      redirect_to event_path(@event)
    else
      render "/events/show"
    end
  end

  def destroy
    @booking.destroy
    redirect_to :back
  end
end
