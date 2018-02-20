# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

i = 0

puts 'Cleaning database...'
User.destroy_all
Space.destroy_all

puts 'Creating spaces...'


users_attributes = []
10.times do

  user = {
  last_name:         Faker::Name.last_name,
  first_name:        Faker::Name.first_name,
  phone_number:      Faker::PhoneNumber.phone_number,
  email:             Faker::Internet.email,
  password:          Faker::Crypto.md5
  }
  users_attributes << user
end

User.create!(users_attributes)


spaces_attributes = []
10.times do

  space = {
    name:         Faker::BossaNova.artist,
    address:      Faker::Address.street_address,
    user_id:      User.find(users_attributes[i])

  }
  i += 1
  spaces_attributes << space
end
Space.create!(spaces_attributes)
puts 'Finished!'


