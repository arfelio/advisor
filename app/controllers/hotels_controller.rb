class HotelsController < ApplicationController
  def index
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def create
    @hotel = Hotel.new(params[:hotel])
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
