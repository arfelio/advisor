class AddBreakfastIncludedToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :breakfast_included, :string
  end
end
