# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Chicken.destroy_all
Booking.destroy_all

john = User.new(name: "John Smith", location: "Montreal", rating: 5, email: "john@email.com", password: "chicken")
john.save!
#Chicken.create!(name: "Hugo")
kia = Chicken.new(name: "Kia", address:"Bergen Street, Brooklyn, New York", age: 2, egg_color: "blue", price: 50, egg_volume: 2, description: "She is a very calme and family-friendly chicken", user_id: john.id)
kia.save!
first_booking = Booking.new(start_date: Date.parse("2019-08-23"), end_date: Date.parse("2019-08-30"), user_id: john.id, chicken_id: kia.id)
first_booking.save!
#Booking.create(start_date: "13.8.2020", end_date: "20.8.2020", user_id: 2, chicken_id: 1)
puts "seed completed"
