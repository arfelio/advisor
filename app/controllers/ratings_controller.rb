class RatingsController < ApplicationController
  #before_filter :authenticate_user!

  #def new
  #  @rating = Rating.new
 # end

  def create
     @hotel = Hotel.find_by_id(params[:rating][:hotel_id])
     if @rating = current_user.ratings.find_by_hotel_id(params[:rating][:hotel_id])
        redirect_to @hotel, :notice =>"you already rate this gotel"
     else
     @rating = Rating.new(params[:rating])
     if @rating.save
       flash[:success] = "Success! you rate this Hotel "
       redirect_to @hotel
     end
   end
  end
end
