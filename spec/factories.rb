include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :hotel do
    title     "Michael Hartl"
    room_description    "michael@example.com"
    price_for_room 100
    breakfast_included "yes"
    image {fixture_file_upload('spec/fixtures/files/image.png', 'image/png')}
    user_id 1
  end
  factory :location do
    hotel
    country "Usa"
    state "Texas"
    city "Austin"
    street "Cows avenue"
  end
  factory :user do
    email  "example@gmail.com"
    password  "123456789"
    password_confirmation "123456789"
  end
  factory :rating do
    rating 5
    user_id 1
    hotel_id 1
  end
  factory :comment do
    content "Lorem Ipsum"
    user_id 1
    hotel_id 1
  end
end