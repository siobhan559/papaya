class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:query].present? && params[:query].reject(&:empty?).present?
      @events = Event.search(params[:query])
    else
      @events = Event.all
    end
    event_markers
    filters
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
    if filters.present?
      @events = @events.search(filters)
    else
      @events = Event.all
    end
  end
end

# if params[:search_query].nil?
#       session[:search] = params.dig(:search, :query)
#       if params[:search_query] == "" || params[:search_query].nil?
#         @items = Item.all
#       else
#         @items = Item.where("name ILIKE ? or description ILIKE ? or category ILIKE ?",
#                             "%#{session[:search]}%", "%#{session[:search]}%", "%#{session[:search]}%")
#       end

#       filters = params.dig(:filters, :category)
#       if filters.present? && filters.reject(&:empty?).present?
#         @items = @items.where(category: filters)
#       end

#       sort = params.dig(:filters, :price)
#       case sort
#       when "Highest first" then @items = @items.order(price: :desc)
#       when "Lowest first" then @items = @items.order(price: :asc)
#       else
#         @items
#       end
#     elsif params[:search_query] == ""
#       @items = Item.all
#     else
#       @items = Item.where("name ILIKE ? or description ILIKE ? or category ILIKE ?",
#                             "%#{params[:search_query]}%", "%#{params[:search_query]}%", "%#{params[:search_query]}%")
#     end
