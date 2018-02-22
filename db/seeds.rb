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
puts 'Cleaning database...'
Space.destroy_all
User.destroy_all
puts 'Creating spaces...'

user = User.create(
  email: 'matthieu@gmail.com',
  password: 'password',
  first_name: 'Matthieu',
  last_name: 'Nicolas',
  phone_number: '0612000000'
)

def scrap_address(url)
  begin
    data = open(url).read
    seed_show = Nokogiri::HTML(data)
    address = seed_show.search('.bf-office-address').text.strip
    description = seed_show.search('.bf-office-deskDescription p').text.strip
    { address: address, description: description }
  rescue OpenURI::HTTPError
    puts "error for #{url}"
    { address: "Chemin de la paix", description: "Lorem ipsum" }
  end
end

i = 1
limit = 3

data_array = []

while i < limit
  url = "http://bureauflexible.fr/?Office_page=#{i}"
  data = open(url).read
  seed = Nokogiri::HTML(data)

  seed.search('.bf-each-office').each do |element|
    sleep(1)
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
  end

  i += 1
end

puts "Finished"

