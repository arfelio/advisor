FactoryGirl.define do
  factory :hotel do
    title     "Michael Hartl"
    room_description    "michael@example.com"
    price_for_room 100
    breakfast_included "yes"
  end
end