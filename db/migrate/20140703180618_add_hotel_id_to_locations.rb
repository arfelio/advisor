class AddHotelIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :hotel_id, :integer
  end
end
