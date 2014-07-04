class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :street

      t.timestamps
    end
  end
end
