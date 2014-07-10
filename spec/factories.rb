include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :hotel do
    title     "Michael Hartl"
    room_description    "michael@example.com"
    price_for_room 100
    breakfast_included "yes"
    image {fixture_file_upload('spec/fixtures/files/image.png', 'image/png')}
   # File.open(File.join(Rails.root, '/spec/fixtures/files/image.png'))
  end
  factory :location do
    hotel
    country "Usa"
    state "Texas"
    city "Austin"
    street "Cows avenue"
   # association :hotel
  end


end