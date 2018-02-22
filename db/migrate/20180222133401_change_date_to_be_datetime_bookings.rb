class ChangeDateToBeDatetimeBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :arrival
    remove_column :bookings, :departure
    add_column :bookings, :arrival, :datetime
    add_column :bookings, :departure, :datetime
  end
end
