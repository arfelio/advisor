class HotelsController < ApplicationController
  def index
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def create
  end

  def new

  end
end
