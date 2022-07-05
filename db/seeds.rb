# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Users..."
user1 = User.create(first_name: "Nico", email: "nico@leaddev.fr", address: "17 rue Sainte, Marseille", last_name: "Nounet", password: "azerty")
user2 = User.create(first_name: "Tojo", email: "tojo@dev.fr", address: "66 rue d'Aubagne, Marseille", last_name: "Martin", password: "azerty")
user3 = User.create(first_name: "Romu", email: "romualdo@dev.fr", address: "23 rue de la République, Marseille", last_name: "Three", password: "azerty")
user4 = User.create(first_name: "Bry", email: "bry@dev.fr", address: "3 rue des Catalans, Marseille", last_name: "Four", password: "azerty")
puts "Users created !"

puts "creating cars"
car1= Car.create(name: "TT", brand: "Audi", user_id: user1.id, kilometers: 100000)
car2=Car.create(name: "Enzo", brand: "Ferrari", user_id: user1.id, kilometers: 10000)
car3=Car.create(name: "Twingo", brand: "Renault", user_id: user1.id, kilometers: 120000)
car4= Car.create(name: "300 SL", brand: "Mercedes", user_id: user1.id, kilometers: 50000)
puts "cars created!"

puts "creating reservations"
reservation1 = Reservation.create(user_id: user1.id, car_id: car2.id)
puts "reservations created!"
