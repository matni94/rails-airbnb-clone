require 'open-uri'
require 'awesome_print'
require "nokogiri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Space.destroy_all
User.destroy_all

user = User.create(
  email: 'matthieu@gmail.com',
  password: 'password',
  first_name: 'Matthieu',
  last_name: 'Nicolas',
  phone_number: '0612000000'
)

i = 1
limit = 67

data_array = []

while i < limit
  url = "http://bureauflexible.fr/?Office_page=#{i}"
  data = open(url).read
  seed = Nokogiri::HTML(data)

  seed.search('.bf-each-office').each do |element|
    name = element.search('.bf-each-office-detailszone a').text.strip
    address = element.search('.bf-each-office-city').text.strip
    price = element.search('.bf-each-office-price').text.strip.delete("€ /mois").to_i
    image_url = element.search('.bf-each-office-image').attr('src').value

    Space.create!(
      name: name,
      address: address,
      price: price,
      image_url: "http://bureauflexible.fr#{image_url}",
      user: user
    )
  end

  i += 1
end

