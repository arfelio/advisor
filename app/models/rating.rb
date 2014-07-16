class Rating < ActiveRecord::Base
  attr_accessible :hotel_id, :rating, :user_id

  belongs_to :user
  belongs_to :hotel

end
