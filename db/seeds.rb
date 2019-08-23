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
Message.destroy_all
Conversation.destroy_all

joana = User.new(first_name: "Joana", last_name: "Smith", location: "Montreal", rating: 5, email: "joana@email.com", password: "chicken", remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566572094/courtney_cmqmbb.jpg")
joana.save!
maria = User.new(first_name: "Maria", last_name: "Farmer", location: "Montreal", rating: 5, email: "maria@email.com", password: "chicken", remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566572091/lea_cyeubu.jpg")
maria.save!
nora = User.new(first_name: "Nora", last_name: "Fischer", location: "Montreal", rating: 4, email: "nora@email.com", password: "chicken", remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566572097/katharina_ykkv5e.jpg")
nora.save!
louis = User.new(first_name: "Louis", last_name: "Miller", location: "Montreal", rating: 4, email: "louis@email.com", password: "chicken", remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566572103/louis_ku60k5.jpg")
louis.save!
samuel = User.new(first_name: "Samuel", last_name: "King", location: "Montreal", rating: 4, email: "samuel@email.com", password: "chicken", remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566572110/sam_oewkes.jpg")
samuel.save!
chen = User.new(first_name: "Chen", last_name: "City", location: "Montreal", rating: 4, email: "chen@email.com", password: "chicken", remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566572113/chen_jlke6m.jpg")
chen.save!

#Chicken.create!(name: "Hugo")

kia = Chicken.new(name: "Kia", address:"1950 Rue Gilford, Montreal", age: 2, egg_color: "blue", price: 0.5, egg_volume: 2, description: "I've been told I'm a bit loud, but it's never intentional. I enjoy napping and spending time with my friends. If you're looking for blue eggs, I might be a great fit!", user_id: maria.id,remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566414587/sven-hornburg-Jgabeh9Yx6w-unsplash_x24lqt.jpg")
kia.save!
roberta = Chicken.new(name: "Roberta", address:"3564 Rue Saint-Denis, Montreal", age: 3, egg_color: "green", price: 0.4, egg_volume: 1, description: "She is a relaxed chicken", user_id: maria.id, remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566414586/john-towner-0uN9iF4mgDI-unsplash_bqyg2m.jpg")
roberta.save!
pia = Chicken.new(name: "Pia", address:"5333 Av. Casgrain, Montreal", age: 3, egg_color: "brown", price: 0.4, egg_volume: 1, description: "She is a bit loud", user_id: maria.id, remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566414586/shannon-vandenheuvel-bI9AeUn15_A-unsplash_cbeeca.jpg")
pia.save!
hugo = Chicken.new(name: "Hugo", address:"1251 Rue Gilford, Montréal", age: 1, egg_color: "blue", price: 0.3, egg_volume: 1, description: "She is very good with animals", user_id: samuel.id, remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566419185/vidar-nordli-mathisen-dC-z4r8tr6U-unsplash_mjoojj.jpg")
hugo.save!

bossy = Chicken.new(name: "Bossy", address:"4581 Park Ave, Montreal", age: 5, egg_color: "pink", price: 0.6, egg_volume: 4, description: "I enjoy spending time with children and dogs, and never miss a meal. My hobbies include eating bugs, wandering the yard and laying eggs. DM me for more information.", user_id: maria.id,remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566573112/ehud-neuhaus-LJOTTEf6DaQ-unsplash_p8zly6.jpg")
bossy.save!
meggy = Chicken.new(name: "Meggy", address:"2047 Mont-Royal Ave E, Montreal", age: 3, egg_color: "green", price: 0.4, egg_volume: 1, description: "She does not like people and is very shy", user_id: maria.id, remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566573112/kazi-faiz-ahmed-jeem-hXXncjTJJ1g-unsplash_wpllmn.jpg")
meggy.save!
dani = Chicken.new(name: "Dani", address:"1019 Mont-Royal Ave E, Montreal", age: 3, egg_color: "brown", price: 0.4, egg_volume: 1, description: "She is a bit crazy", user_id: maria.id, remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566573114/jason-leung-AVbFNg1r9fg-unsplash_arsvty.jpg")
dani.save!
sandy = Chicken.new(name: "Sandy", address:"3801 Rue Université, Montréal", age: 10, egg_color: "white", price: 0.3, egg_volume: 1, description: "She loves dogs", user_id: samuel.id, remote_photo_url: "https://res.cloudinary.com/dd9qabk1u/image/upload/v1566573111/patrick-kariuki-AS5BN2vntRg-unsplash_ohmwwy.jpg")
sandy.save!

first_booking = Booking.new(start_date: Date.parse("2019-09-07"), end_date: Date.parse("2019-10-23"), user_id: maria.id, chicken_id: kia.id)
first_booking.save!
second_booking = Booking.new(start_date: Date.parse("2019-08-23"), end_date: Date.parse("2019-08-30"), user_id: maria.id, chicken_id: roberta.id)
second_booking.save!
third_booking = Booking.new(start_date: Date.parse("2019-08-23"), end_date: Date.parse("2019-08-30"), user_id: maria.id, chicken_id: hugo.id)
third_booking.save!
#Booking.create(start_date: "13.8.2020", end_date: "20.8.2020", user_id: 2, chicken_id: 1)
puts "seed completed"
