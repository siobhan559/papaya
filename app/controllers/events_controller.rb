class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_user!, only: :toggle_favorite

  def index
    search = params.dig(:search, :query) || session[:search]
    if search.present? && search != ""
      session[:search] = search
      @events = Event.includes([user: {photo_attachment: :blob}, photo_attachment: :blob]).search(search)
    else
      @events = Event.includes([user: {photo_attachment: :blob}, photo_attachment: :blob])
    end
    event_markers
    filters if params.dig(:filters, :category)&.reject(&:empty?)&.join(" ").present? || params.dig(:filters, :date)
  end

  def show
    @event = Event.find(params[:id])
    @booking = Booking.where(user: current_user, event: @event)
    @booking = @booking.empty? ? Booking.new : @booking[0]
    @markers =  [{
      lat: @event.latitude,
      lng: @event.longitude,
      info_window: render_to_string(partial: "info_window", locals: { event: @event }),
      image_url: helpers.asset_url('placeholder.png')
    }]
  end

  def toggle_favorite
    @event = Event.find(params[:id])
    current_user.favorited?(@event) ? current_user.unfavorite(@event) : current_user.favorite(@event)
    redirect_to @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render "pages/profile"
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
    redirect_back(fallback_location: events_path)
  end

  private

  def event_params
    params.require(:event).permit(:capacity, :name, :description, :address, :start_time, :end_time, :photo, :category)
  end

  def event_markers
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window: render_to_string(partial: "info_window", locals: { event: event }),
        image_url: helpers.asset_url('placeholder.png')
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
    when "Earliest Date" then @events = @events.reorder(start_time: :asc)
    when "Latest Date" then @events = @events.reorder(start_time: :desc)
    else
      @events
    end

    # if filters.nil? && params[:query].nil?
    #   @events = Event.all
    # end
  end

end
