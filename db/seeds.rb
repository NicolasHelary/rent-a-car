# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
puts 'destroying everything'
Reservation.destroy_all
Car.destroy_all
User.destroy_all
puts 'everything destroyed'
puts "Creating Users..."
user1 = User.create(first_name: "Nico", email: "nico@leaddev.fr", address: "17 rue Sainte, Marseille", last_name: "Nounet", password: "azerty")
user2 = User.create(first_name: "Tojo", email: "tojo@dev.fr", address: "66 rue d'Aubagne, Marseille", last_name: "Martin", password: "azerty")
user3 = User.create(first_name: "Romu", email: "romualdo@dev.fr", address: "23 rue de la République, Marseille", last_name: "Three", password: "azerty")
user4 = User.create(first_name: "Bry", email: "bry@dev.fr", address: "3 rue des Catalans, Marseille", last_name: "Four", password: "azerty")
user5 = User.create(first_name: "Brian", email: "brian@dev.fr", address: "21 rue Haxo, Marseille", last_name: "Five", password: "azerty")
puts "Users created !"

puts "loading user pics"
pp1 =URI.open('https://res.cloudinary.com/ddgdamfek/image/upload/v1656067196/production/tuo5ifh4bxqx52lmnd4o24g4qwx0.jpg')
pp2 =URI.open('https://res.cloudinary.com/ddgdamfek/image/upload/v1656067192/production/zu2bx6agnto8fdueuyh3e7w117sm.jpg')
pp3 =URI.open('https://res.cloudinary.com/ddgdamfek/image/upload/v1656067193/production/2baqa4tvkfv89mqjb2z0jl6yewfs.webp')
pp4 =URI.open('https://res.cloudinary.com/ddgdamfek/image/upload/v1656067190/production/9rw23bxdms42h7n8g2nb3mjb320c.jpg')
pp5 =URI.open('https://res.cloudinary.com/ddgdamfek/image/upload/v1656067184/production/eq3v5g7hs9n20mjx6g5i1td8u2k4.jpg')
puts "user pics loaded"

puts "attachinrg pp to user"
user1.pp.attach(io: pp1, filename: 'tuo5ifh4bxqx52lmnd4o24g4qwx0', content_type: 'image/jpg')
user2.pp.attach(io: pp2, filename: 'zu2bx6agnto8fdueuyh3e7w117sm', content_type: 'image/jpg')
user3.pp.attach(io: pp3, filename: '2baqa4tvkfv89mqjb2z0jl6yewfs', content_type: 'image/webp')
user4.pp.attach(io: pp4, filename: 'production/9rw23bxdms42h7n8g2nb3mjb320c', content_type: 'image/jpg')
user5.pp.attach(io: pp5, filename: 'eq3v5g7hs9n20mjx6g5i1td8u2k4', content_type: 'image/jpg')
puts "pp attached to user"

puts "creating cars"
car1= Car.create(name: "TT", brand: "Audi", user_id: user1.id, kilometers: 100000)
car2=Car.create(name: "Enzo", brand: "Ferrari", user_id: user2.id, kilometers: 10000)
car3=Car.create(name: "Twingo", brand: "Renault", user_id: user3.id, kilometers: 120000)
car4= Car.create(name: "300 SL", brand: "Mercedes", user_id: user4.id, kilometers: 50000)
car5= Car.create(name: "A", brand: "MG", user_id: user5.id, kilometers: 10000)
puts "cars created!"

puts "loading car_pics"
car_pic1 = URI.open('https://res.cloudinary.com/ddgdamfek/image/upload/v1657015725/rent-a-car/2021-audi-tts-coupe-competition-plus_kikhrh.webp')
car_pic2 = URI.open('https://res.cloudinary.com/ddgdamfek/image/upload/v1657015724/rent-a-car/02_Ferrari_Enzo.jpg_fuperr.webp')
car_pic3 = URI.open('https://res.cloudinary.com/ddgdamfek/image/upload/v1657015725/rent-a-car/420392-essai-du-grenier-renault-twingo-2001_roszes.jpg')
car_pic4 = URI.open('https://res.cloudinary.com/ddgdamfek/image/upload/v1657015725/rent-a-car/mercedes-300-sl-fangio-1_x6pjcn.jpg')
car_pic5 = URI.open('https://res.cloudinary.com/ddgdamfek/image/upload/v1657015725/rent-a-car/mga-1600-03-1453902622-bffaf1e8_dmvszt.jpg')
puts "car_pics loaded !"



puts "attaching pic to car"
car1.photo.attach(io: car_pic1, filename: '2021-audi-tts-coupe-competition-plus_kikhrh', content_type: 'image/webp')
car2.photo.attach(io: car_pic2, filename: '02_Ferrari_Enzo.jpg_fuperr', content_type: 'image/webp')
car3.photo.attach(io: car_pic3, filename: '420392-essai-du-grenier-renault-twingo-2001_roszes', content_type: 'image/jpg')
car4.photo.attach(io: car_pic4, filename: 'mercedes-300-sl-fangio-1_x6pjcn', content_type: 'image/jpg')
car5.photo.attach(io: car_pic5, filename: 'mga-1600-03-1453902622-bffaf1e8_dmvszt', content_type: 'image/jpg')
# car5.photo.attach(io: car_pic5, filename: 'Ice_Dragon_decukc', content_type: 'image/jpg')
puts "pic attached to car"


puts "creating reservations"
reservation1 = Reservation.create(user_id: user1.id, car_id: car2.id)
puts "reservations created!"
