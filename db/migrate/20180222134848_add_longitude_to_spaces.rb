class AddLongitudeToSpaces < ActiveRecord::Migration[5.1]
  def change
    add_column :spaces, :longitude, :float
  end
end
