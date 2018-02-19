class AddNameToSpaces < ActiveRecord::Migration[5.1]
  def change
    add_column :spaces, :name, :string
  end
end
