class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :create, :show, :destroy, :edit]
  def new
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end



  private

  def params_booking
    params.require(:booking).permit(:arrival, :departure)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
