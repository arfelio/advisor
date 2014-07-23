class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @hotel = Hotel.find_by_id(params[:comment][:hotel_id])
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "You add a comment"
      redirect_to @hotel
    else
      flash[:alert] = "Comment not added"
      redirect_to @hotel
    end
  end
end
