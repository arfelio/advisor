class Location < ActiveRecord::Base
  attr_accessible :city, :country, :state, :street, :hotel_id
  belongs_to :hotel
  validates :city, :country, :state, :street, presence:true, :length=>{ :maximum=>140 }
end
