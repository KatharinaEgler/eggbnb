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

john = User.new(first_name: "John", last_name: "Smith", location: "Montreal", rating: 5, email: "john@email.com", password: "chicken", remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566414756/caroline-hernandez-TMpQ5R9mbOc-unsplash_xowaqt.jpg")
john.save!
bill = User.new(first_name: "Bill", last_name: "Farmer", location: "Montreal", rating: 5, email: "bill@email.com", password: "chicken", remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566414586/gregory-hayes-QFmNQXLPbZc-unsplash_uzib8w.jpg")
bill.save!
nora = User.new(first_name: "Nora", last_name: "Fischer", location: "Montreal", rating: 4, email: "nora@email.com", password: "chicken", remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566514738/sage-kirk-Wx2AjoLtpcU-unsplash_u74amp.jpg")
nora.save!

#Chicken.create!(name: "Hugo")

kia = Chicken.new(name: "Kia", address:"1950 Rue Gilford, Montreal", age: 2, egg_color: "blue", price: 0.5, egg_volume: 2, description: "She is a very calme and family-friendly chicken", user_id: john.id,remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566414587/sven-hornburg-Jgabeh9Yx6w-unsplash_x24lqt.jpg")
kia.save!
roberta = Chicken.new(name: "Roberta", address:"3564 Rue Saint-Denis, Montreal", age: 3, egg_color: "green", price: 0.4, egg_volume: 1, description: "She is a relaxed chicken", user_id: bill.id, remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566414586/john-towner-0uN9iF4mgDI-unsplash_bqyg2m.jpg")
roberta.save!
pia = Chicken.new(name: "Pia", address:"5333 Av. Casgrain, Montreal", age: 3, egg_color: "brown", price: 0.4, egg_volume: 1, description: "She is a bit loud", user_id: bill.id, remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566414586/shannon-vandenheuvel-bI9AeUn15_A-unsplash_cbeeca.jpg")
pia.save!
hugo = Chicken.new(name: "Hugo", address:"1251 Rue Gilford, Montréal", age: 1, egg_color: "white", price: 0.3, egg_volume: 1, description: "She is very good with animals", user_id: john.id, remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566419185/vidar-nordli-mathisen-dC-z4r8tr6U-unsplash_mjoojj.jpg")
hugo.save!
first_booking = Booking.new(start_date: Date.parse("2019-09-07"), end_date: Date.parse("2019-10-23"), user_id: john.id, chicken_id: kia.id)
first_booking.save!
second_booking = Booking.new(start_date: Date.parse("2019-08-23"), end_date: Date.parse("2019-08-30"), user_id: john.id, chicken_id: roberta.id)
second_booking.save!
third_booking = Booking.new(start_date: Date.parse("2019-08-23"), end_date: Date.parse("2019-08-30"), user_id: john.id, chicken_id: hugo.id)
third_booking.save!
#Booking.create(start_date: "13.8.2020", end_date: "20.8.2020", user_id: 2, chicken_id: 1)
puts "seed completed"
