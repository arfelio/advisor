class Comment < ActiveRecord::Base
  attr_accessible :content, :hotel_id, :user_id
  belongs_to :user
  belongs_to :hotel
  validates :content, presence: true, length: { maximum: 250 }
  validates :hotel_id, :user_id, presence: true
end
