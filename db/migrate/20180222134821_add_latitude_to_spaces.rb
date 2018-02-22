class AddLatitudeToSpaces < ActiveRecord::Migration[5.1]
  def change
    add_column :spaces, :latitude, :float
  end
end
