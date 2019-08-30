# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# creates an Aria Stark user plus 10 random users
# if a seeding fails it is due to repetition in the email (having mutiple exact same names)

# require 'faker'
puts 'Cleaning tables users, items, transactions...'
Item.destroy_all
User.destroy_all
Transaction.destroy_all

puts 'Creating seeds users...'

users = []

puts "Creating user Arya Stark"

users << {
    first_name: 'Arya',
    last_name: 'Stark',
    user_location: 'Universidade de Lisboa',
    password: '123456',
    email: 'aryastark@mat3rial.com',
    remote_photo_url: "https://res.cloudinary.com/dstl9dcq5/image/upload/v1567112640/Arya_ygorju.jpg"
  }

puts "User Arya Stark created"


puts "Creating user Rita Laia 'The Queen, Lordina of the 7 web sites"

users << {
    first_name: 'Rita',
    last_name: 'Laia',
    user_location: 'Universidade de Arquitectura de Lisboa',
    password: '123456',
    email: 'rita@mat3rial.com',
    remote_photo_url: "https://avatars3.githubusercontent.com/u/49205729?v=4"
  }

puts "User Rita Laia 'The Queen, Lordina of the 7 web sites' created"

name_array = []

8.times {

  # f_name = ['Joao', 'Antonio', 'Julius', 'Rita', 'Ijoline', 'Karim'].sample
  # l_name = ['Muller', 'Laia', 'Ussene', 'Homphomsiltham', 'Oliveira', 'Fernandes', 'Sousa'].sample
  f_name = Faker::Name.first_name
  l_name = Faker::Name.last_name

  username ="#{f_name + l_name}"

  name_array << "#{f_name +" "+ l_name}"

  if name_array == name_array.uniq
    # puts "** Generating user #{f_name +" "+ l_name}"

    puts "   ** #{f_name +" "+ l_name}"
    # user_photo_url = "https://res.cloudinary.com/dstl9dcq5/image/upload/v1566922525/Brad_mpmfwz.jpg"
    users << {
      first_name: f_name,
      last_name: l_name,
      user_location:      ['Universidade Lisboa', 'Universidade NOVA de Lisboa', 'Faculty of Social and Human Sciences, Lisboa', 'National School of Public Health, Lisboa', 'UMC, Lisboa','Escola Politécnica de Lisboa'].sample,
      password:           "123456",
      email:              "#{username}@mat3rial.com",
      remote_photo_url: Faker::Avatar.image( size: "50x50")
    }
    puts "      << user added"
  else
    puts "\n -----!!repeted same name!!----- \n"
  end
  name_array.uniq!
}
# puts "if a seeding fails it is due to repetition in the email (having mutiple exact same names)"
User.create!(users)
puts '>> Finished creating Users! <<'

# -----------------------------------------------------------------------------

# seeding for items


# puts 'Cleaning Items table...'
# Item.destroy_all

puts 'Creating seeds items...'
items = []

stationery_array = ['Staples Composition Notebook', 'Texas Instruments TI-84', 'Crayola® Crayons - Box 24', 'Hammermill Copy Plus', 'Post-it® Super Sticky Notes','Fucking Brilliant Pencils']
photo_array = ["https://res.cloudinary.com/dstl9dcq5/image/upload/v1567118529/PUR/notebook_k79rkn.jpg",
              "https://res.cloudinary.com/dstl9dcq5/image/upload/v1567118530/PUR/TI842_jn8n2d.jpg",
              "https://res.cloudinary.com/dstl9dcq5/image/upload/v1567118530/PUR/Crayola_iblnow.jpg",
              "https://res.cloudinary.com/dstl9dcq5/image/upload/v1567118529/PUR/Hammer_wjzt6t.jpg",
              "https://res.cloudinary.com/dstl9dcq5/image/upload/v1567118529/PUR/postit_etbfft.jpg",
              "https://res.cloudinary.com/dstl9dcq5/image/upload/v1567118529/PUR/pencils_kn2lok.webp"]
category_array = %w[Stationary Electronic Stationary Paper Other Stationary]
11.times {
  i = (1..5).to_a.sample - 1
  items << {
    description: ['Brand new', 'Used', 'Old, but functioning'].sample,
    category: category_array[i],
    price: "#{(rand * 1000).floor / 100}",
    location: ['Universidade Lisboa', 'Universidade NOVA de Lisboa', 'Faculty of Social and Human Sciences, Lisboa', 'National School of Public Health, Lisboa', 'UMC, Lisboa','Escola Politécnica de Lisboa'].sample,
    user_id: User.all.sample.id,
    title: stationery_array[i],
    remote_photo_url: photo_array[i]
  }
}
Item.create!(items)
puts '>> Finished creating Items! <<'

# -----------------------------------------------------------------------------

# doing seed manualy

# transaction for items
# puts 'Creating seeds transactions...'
# transactions = []

# 20.times{
#   transactions << {
#     user_id: User.all.sample.id,
#     item_id: Item.all.sample.id,
#     status: %w(accepted decline pending).sample
#   }
# }
# Transaction.create!(transactions)
# puts 'Finished!'


