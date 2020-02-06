# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
city_id = []
10.times do
  city = City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code )
  puts "Création d'une ville"
  city_id << city.id
end
user_id = []
10.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph(sentence_count: 2), email: Faker::Internet.email, age: Faker::Number.number(digits: 2), city_id: city_id.sample )
  puts "Création d'un user"
  user_id << user.id
end
gossip_id =[]
20.times do
  gossip = Gossip.create!(title: Faker::Book.title, content:Faker::Lorem.paragraph(sentence_count: 2), user_id: user_id.sample)
  puts "Création d'un gossip"
  gossip_id << gossip.id
end
tag_id = []
10.times do
  tag = Tag.create!(title: Faker::Food.fruits )
  puts "Création d'un tag"
  tag_id << tag.id
end
20.times do
  connect = Connect.create!(gossip_id: gossip_id.sample, tag_id: tag_id.sample)
  puts "Création d'une connection"
end