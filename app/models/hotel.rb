class Hotel < ActiveRecord::Base
  attr_accessible :room_description, :title, :image, :price_for_room, :breakfast_included,
                  :location_attributes
               #   :location_attributes
  validates :title, presence: true, length:{ maximum:140 }
  validates :room_description, presence: true, length:{ maximum:140 }
  validates :price_for_room, presence: true, inclusion:{ :in => 0..100,
    :message => "can not be negative or greater then 1000000" }
  validates :breakfast_included, presence: true, inclusion:{ :in => %w(yes no) }
  validates :image, presence: true
  has_one :location

  accepts_nested_attributes_for :location
  mount_uploader :image, ImageUploader
end
