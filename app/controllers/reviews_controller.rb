class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
     if @review.save
      redirect_to space_path(@review.booking.space.id)
    else
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
