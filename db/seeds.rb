# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

stacey = User.create(
  name: "Stacey Sugiono",
  handle: "staysee",
  email: "staceysugiono@gmail.com",
  password: "stacey",
  password_confirmation: "stacey",
  profile_image_url: "http://tinyurl.com/zmzbry4",
  bio: "Admin"
  )

rachel = User.create(
  name: "Rachel Lust",
  handle: "rachel_lust",
  email: "rachel_lust@example.com",
  password: "password",
  password_confirmation: "password",
  profile_image_url: "http://tinyurl.com/htybc6p",
  bio: "I love hoop dancing"
  )

mabel = User.create(
  name: "Mabel Park",
  handle: "fire_hoopster",
  email: "mable_fire@example.com",
  password: "password",
  password_confirmation: "password",
  profile_image_url: "http://tinyurl.com/zbpj8aa",
  bio: "I love fire"
  )

20.times do
  User.create(name: Faker::Name.name, handle: Faker::Internet.user_name, email: Faker::Internet.free_email, password: "password", password_confirmation: "password", profile_image_url: Faker::Avatar.image, bio: "Hi there! Flow with me!")
end


event1 = Event.create(
  name: "Glow Flow",
  event_type: "Jam",
  event_date: Faker::Date.forward(20),
  event_time: "7:00 pm",
  description: "Night Time Flow Jam. Bring all your glow toys!",
  street: "123 Santa Monica Blvd",
  city: "Santa Monica",
  state: "CA",
  zip_code: 91837,
  user_id: 1)

event2 = Event.create(
  name: "Spins & Breaks",
  event_type: "Workshop",
  event_date: Faker::Date.forward(20),
  event_time: "5:00 pm",
  description: "Learn spins and breaks at an intermediate level",
  street: "1600 SW 21st Way",
  city: "Ft. Lauderdale",
  state: "FL",
  zip_code: 33312,
  user_id: 2)

30.times do
  Event.create(name: Faker::Hipster.word, event_type: "Workshop", event_date: Faker::Date.forward(90), event_time: Faker::Time.forward(90, :afternoon), description: Faker::Hipster.paragraph, street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip_code: Faker::Address.zip_code, user_id: Faker::Number.between(1, User.all.length))
end


# users = User.order(:created_at).take(6)
30.times do
  Post.create(title: Faker::Book.title, body: Faker::Lorem.paragraph, user_id: Faker::Number.between(1, User.all.length))
end

