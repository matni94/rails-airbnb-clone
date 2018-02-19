class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
