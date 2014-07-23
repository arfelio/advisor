class HotelsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new]

  def top_five
    @top_five = Hotel.all.sort_by{ |h| -h.average_rating }.first(5)
  end

  def index
    @hotels = Hotel.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @hotel = Hotel.find(params[:id])
    @rating = Rating.new
    @comment = Comment.new
    rescue ActiveRecord::RecordNotFound
     logger.error "Attempt to access invalid hotel #{params[:id]}"
      redirect_to hotels_url, notice: 'Invalid hotel'
  end

  def create
    @hotel = current_user.hotels.build(params[:hotel])
    if @hotel.save
      flash[:success] = "Success! Hotel created"
      redirect_to @hotel
    else
      render 'new'
    end
  end

  def new
    @hotel = Hotel.new
  end
end
