class Location < ActiveRecord::Base
  attr_accessible :city, :country, :state, :street, :hotel_id
  belongs_to :hotel
end
