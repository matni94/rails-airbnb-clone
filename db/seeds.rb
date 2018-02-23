require 'open-uri'
require 'awesome_print'
require "nokogiri"
require "faker"
require "csv"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Review.destroy_all
Space.destroy_all
User.destroy_all
puts 'Creating spaces...'

def scrap_address(url)
  begin
    data = open(url).read
    seed_show = Nokogiri::HTML(data)
    address = seed_show.search('.bf-office-address').text.strip
    description = seed_show.search('.bf-office-deskDescription p').text.strip
    { address: address, description: description }
  rescue OpenURI::HTTPError
    puts "error for #{url}"
    { address: "Tour eiffel", description: "Lorem ipsum" }
  end
end

i = 1
limit = 10

data_array = []

while i < limit
  url = "http://bureauflexible.fr/?Office_page=#{i}"
  data = open(url).read
  seed = Nokogiri::HTML(data)

  seed.search('.bf-each-office').each do |element|
    sleep(1)
    user = User.create(
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::Number.number
    )
    name = element.search('.bf-each-office-detailszone a').text.strip
    # address = element.search('.bf-each-office-city').text.strip
    price = element.search('.bf-each-office-price').text.strip.delete("€ /mois").to_i
    image_url = element.search('.bf-each-office-image').attr('src').value
    url_show = element.search('.bf-each-office-topimagezone').attr('href').value
    extra_info = scrap_address("http://bureauflexible.fr#{url_show}")
    Space.create!(
      name: name,
      address: extra_info[:address],
      price: price,
      image_url: "http://bureauflexible.fr#{image_url}",
      user: user,
      description: extra_info[:description]
    )

    @space = Space.last

    CSV.open("index_cards.csv", "a") do |row|
      row << [@space.name, @space.address, @space.price, @space.image_url]
    end
  end

  i += 1
end

isa = User.create!(
      email: "iza@gmail.com",
      password: "azerty",
      first_name: "isabelle",
      last_name: "Pontoizeau",
      phone_number: "0612345678"
)

lahb = User.create!(
      email: "lahb@gmail.com",
      password: "azerty",
      first_name: "lahbib",
      last_name: "belhaddad",
      phone_number: "0612345679"
)

moh = User.create!(
      email: "moh@gmail.com",
      password: "azerty",
      first_name: "mohamed",
      last_name: "Diop",
      phone_number: "0612345680"
)

Space.create!(
      name: "Joli studio avec vu sur Fourvière",
      address: "36 rue de Fourvière, LYON",
      price: "50€/h",
      image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Lyon_basilique_de_fourvi%C3%A8re.jpg/1200px-Lyon_basilique_de_fourvi%C3%A8re.jpg",
      user: lahb,
      description: "Très calme pour travailler sur votre appli"
    )

lahb.spaces.first.bookings.create!(arrival: "2018-02-22 14:00:00 UTC", departure: "2018-02-22 15:00:00 UTC", guest_number: 1, user: moh)
lahb.spaces.first.bookings.create!(arrival: "2018-02-23 10:00:00 UTC", departure: "2018-02-23 14:00:00 UTC", guest_number: 1, user: moh)
lahb.spaces.first.bookings.create!(arrival: "2018-02-25 20:00:00 UTC", departure: "2018-02-25 00:00:00 UTC", guest_number: 1, user: moh)


puts "Finished"

