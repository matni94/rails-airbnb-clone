class AddPriceToSpaces < ActiveRecord::Migration[5.1]
  def change
    add_column :spaces, :price, :integer
  end
end
