# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



require 'faker'
Faker::Config.locale = 'fr'

puts '----- start seed ------'

City.destroy_all
House.destroy_all
User.destroy_all
Reservation.destroy_all
# reset tables
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
puts '-- clear and reset tables --'

# City
10.times do |i|
  City.create!(
    name: Faker::Address.city
  )
end
puts '-- 10 cities --'

# User
10.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    description:  Faker::Lorem.sentences(number: rand(3..6)).join(' ')
  )
end
puts '-- 10 users --'

# House
10.times do |i|
  House.create!(
    number_of_beds: rand(1..5),
    price_per_night: rand(200..5000).to_f/10,
    description: Faker::Lorem.sentences(number: rand(3..6)).join(' '),
    have_wifi: [true, false].sample,
    # foreign keys
    city: City.all.sample,
    owner: User.all.sample
  )
end
puts '-- 10 houses --'

# Reservation
20.times do |i|
  house = House.all.sample
  Reservation.create!(
    start_date: Faker::Date.between(from: 30.days.ago, to: Faker::Date.forward(days: 30)) ,
    duration_in_night: rand(1..10),
    #foreign keys
    house: House.all.sample,
    guest: User.all.sample
  )
end
puts '-- 20 reservations --'

# array = [
#   {date: "10/01/2024".to_datetime, duration: 10}, #false
#   {date: "10/01/2024".to_datetime, duration: 5}, #true
#   {date: "14/02/2024".to_datetime, duration: 3}, #false
# ]
# array.each do |p|
#   Reservation.create!(
#     start_date: p[:date],
#     duration_in_night: p[:duration],
#     #foreign keys
#     house: House.find(5),
#     guest: User.find(3)
#   )
# end
