class AddPhotoToSpaces < ActiveRecord::Migration[5.1]
  def change
    add_column :spaces, :photo, :string
  end
end
