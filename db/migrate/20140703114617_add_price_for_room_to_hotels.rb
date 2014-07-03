class AddPriceForRoomToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :price_for_room, :integer
  end
end
