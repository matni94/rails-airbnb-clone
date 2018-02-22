class UsersController < ApplicationController
  def edit
  end

  def update
  end

  def destroy
  end

  def dashboard
    @user = current_user
    # @user.bookings = Booking.where(user_id: current_user)
    # @user.spaces = Space.where(user_id: current_user)
    # @user.spaces.each do |space|
    #   space.bookings = Booking.where(space_id: space.id)
    # end

    @bookings_visitor = current_user.bookings
    @bookings_owner = current_user.owner_bookings
  end


end
