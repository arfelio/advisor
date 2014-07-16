class HotelsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new]

  def index
  end

  def show
    @hotel = Hotel.find(params[:id])
    @rating = Rating.new
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
