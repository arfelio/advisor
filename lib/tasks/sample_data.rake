namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_hotels
  end
end

def make_users

  3.times do |n|
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_hotels
  users = User.all
  2.times do
    title = Faker::Lorem.word
    room_description = Faker::Lorem.sentence
    price_for_room = Faker::Number.number(2)
    breakfast_included = 'yes'
    image =  File.new("#{Rails.root}/spec/fixtures/files/image.png")
    users.each do |user|
      loc_adress = { :country => Faker::Address.country,
                                :state =>  Faker::Address.state,
                                :city => Faker::Address.city,
                                :street => Faker::Address.street_name }


      user.hotels.create!(title: title,room_description: room_description,
                          price_for_room: price_for_room,
                          breakfast_included: breakfast_included,
                          image: image,
                          location_attributes: loc_adress )
    end
  end
end