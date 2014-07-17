class Hotel < ActiveRecord::Base
  attr_accessible :room_description, :title, :image, :price_for_room, :breakfast_included,
                  :location_attributes, :user_id

  validates :title, presence: true, length:{ maximum:140 }
  validates :room_description, presence: true, length:{ maximum:500 }
  validates :price_for_room, presence: true, inclusion:{ :in => 0..10000,
    :message => "can not be negative or greater then 10000" }
  validates :breakfast_included, presence: true, inclusion:{ :in => %w(yes no) }
  validates :image, presence: true

  has_one :location
  belongs_to :user
  has_many :ratings
  has_many :raters, :through => :ratings, :source => :users
  has_many :comments
  accepts_nested_attributes_for :location
  mount_uploader :image, ImageUploader



  def average_rating
    ratings = Rating.find_all_by_hotel_id(self.id)
    return 0 if ratings.length == 0
    (ratings.sum{|r| r.rating})/(ratings.length).round(2)
  end
end
