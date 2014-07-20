class Rating < ActiveRecord::Base
  attr_accessible :hotel_id, :rating, :user_id

  belongs_to :user
  belongs_to :hotel

  validates :hotel_id, :rating, :user_id, presence: true, inclusion:{ :in => 0..5 }
end
