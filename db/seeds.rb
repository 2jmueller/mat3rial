# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(first_name: "Rita", last_name: "The Queen", user_location: "Monsanto" , email: "thequeen@lw.org", password: "lookingforking")
user.save!

item1 = Item.create(title: 'pencils', description: 'Used', category: 'pencils', location:'Lisbon', sold:'not sold', user_id:'1', price: 50.0)
item1.save!

