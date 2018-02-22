class AddValidationToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :accepted
  end
end
