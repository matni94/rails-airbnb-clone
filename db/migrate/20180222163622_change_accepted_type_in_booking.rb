class ChangeAcceptedTypeInBooking < ActiveRecord::Migration[5.1]
  def change
    change_column :bookings, :accepted, :string
  end
end
