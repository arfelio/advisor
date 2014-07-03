class Hotel < ActiveRecord::Base
  attr_accessible :room_description, :title, :price_for_room, :breakfast_included
  validates :title, presence: true, length:{ maximum:140 }
  validates :room_description, presence: true, length:{ maximum:140 }
  validates :price_for_room, presence: true, inclusion:{ :in => 0..100 }
  validates :breakfast_included, presence: true, inclusion:{ :in => %w(yes no) }
end
