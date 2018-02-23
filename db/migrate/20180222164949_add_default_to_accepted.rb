class AddDefaultToAccepted < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:bookings, :accepted, "pending")
  end
end
