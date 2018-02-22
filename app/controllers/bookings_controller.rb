class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :show, :destroy, :edit]
  before_action :set_space, only: [:create]
  def new
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    @booking.space = @space
    if @booking.save
      redirect_to dashboard_path
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
    params.require(:booking).permit(:arrival, :departure, :guest_number, :accepted)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_space
    @space = Space.find(params[:space_id])
  end
end
