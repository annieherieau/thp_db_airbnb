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
Faker::UniqueGenerator.clear

puts '----- start seed ------'

City.destroy_all
Listing.destroy_all
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
    name: Faker::Address.city,
    zip_code: Faker::Address.unique.zip_code
  )
end
puts '-- 10 cities --'

# User
phone_array = ['01', '02','03','04','05','06','07','08', '09','00']
20.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: Faker::Internet.unique.email,
    phone: phone_array.sample(5).join,
    description:  Faker::Lorem.sentences(number: rand(3..6)).join(' ')
  )
end
puts '-- 20 users --'

# Listing
50.times do |i|
  l = Listing.create!(
    available_beds: rand(1..5),
    price: rand(200..5000).to_f/10,
    description: Faker::Lorem.sentences(number: rand(3..6)).join(' '),
    welcome_message: Faker::Lorem.sentences(number: rand(1..3)).join(' '),
    has_wifi: [true, false].sample,
    # foreign keys
    city: City.all.sample,
    owner: User.all.sample
  )
  # 5 réservations dans le passé
  5.times do |i|
    start_date = Faker::Date.between(from: 30.days.ago, to: 10.days.ago)
    Reservation.create!(
      start_date: start_date,
      end_date: start_date + (rand(1..10)),
      #foreign keys
      listing: l,
      guest: User.all.sample
    )
  end
  # 5 réservations dans le futur
  5.times do |i|
    start_date = Faker::Date.forward(days: 30)
    Reservation.create!(
      start_date: start_date,
      end_date: start_date + (rand(1..10)),
      #foreign keys
      listing: l,
      guest: User.all.sample
    )
  end
end
puts '-- 50 listings --'
puts '-- 500 reservations --'

#   array = [
#     {start_date: "25/01/2024".to_datetime, end_date: "25/01/2024".to_datetime + 10}, #false
#     {start_date: "30/01/2024".to_datetime, end_date: "30/01/2024".to_datetime +  5}, #true
#     {start_date: "23/01/2024".to_datetime, end_date: "23/01/2024".to_datetime +  3}, #false
#   ]
# array.each do |p|
#   Reservation.create!(
#     start_date: p[:start_date],
#     end_date: p[:end_date],
#     #foreign keys
#     listing: Listing.find(5),
#     guest: User.all.sample
#   )
# end
