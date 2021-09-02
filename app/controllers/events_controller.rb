class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:search][:query].present? && params[:search][:query] != ""
      @events = Event.search(params[:search][:query])
    else
      @events = Event.all
    end
    event_markers
    filters if params.dig(:filters, :category)&.reject(&:empty?)&.join(" ").present?
  end

  def show
    @event = Event.find(params[:id])
    @booking = Booking.where(user: current_user, event: @event)
    @booking = @booking.empty? ? Booking.new : @booking[0]
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      # render 'pages/profile'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      # render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to :back
  end

  private

  def event_params
    params.require(:event).permit(:capacity, :name, :description, :category,
      :recurrence_times, :recurrence_frequency,
      :address, :latitude, :longitude, :start_time, :end_time, :photo)
  end

  def event_markers
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
      }
    end
  end

  def filters
    filters = params.dig(:filters, :category)&.reject(&:empty?)&.join(" ")
    sort = params.dig(:filters, :date)
    if filters.present?
      @events = @events.search(filters)
    end

    case sort
    when "Earliest Date" then @events = @events.order(start_time: :asc)
    when "Latest Date" then @events = @events.order(start_time: :desc)
    else
      @events
    end

    # if filters.nil? && params[:query].nil?
    #   @events = Event.all
    # end
  end

end
