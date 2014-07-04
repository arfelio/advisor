class HotelsController < ApplicationController
  def index
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def create
    @hotel = Hotel.new(params[:hotel])
    if @hotel.save

      flash[:success] = "Welcome to the Sample App!"
      redirect_to @hotel
    else
      render 'new'
    end
  end

  def new
    @hotel = Hotel.new
  end
end
