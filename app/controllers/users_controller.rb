class UsersController < ApplicationController
  def edit
  end

  def update
  end

  def destroy
  end

  def dashboard
    @user = current_user
    @bookings_visitor = current_user.bookings
    @bookings_owner = current_user.owner_bookings
  end

end
