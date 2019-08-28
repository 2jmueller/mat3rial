# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# creates an Aria Stark user plus 10 random users
# if a seeding fails it is due to repetition in the email (having mutiple exact same names)

puts 'Cleaning user table...'
User.destroy_all

puts 'Creating seeds users...'

users = []

puts "Created user Aria Stark"

users << {
    first_name: 'Aria',
    last_name: 'Star',
    user_location: 'University of Winterfel',
    password: '123456',
    email: 'ariastark@mat3rial_unicorn.com'
  }

name_array = []

20.times {

  f_name = ['Joao', 'Antonio', 'Julius', 'Rita', 'Ijoline', 'Karim'].sample
  l_name = ['Muller', 'Laia', 'Ussene', 'Homphomsiltham', 'Oliveira', 'Fernandes', 'Sousa'].sample
  username ="#{f_name + l_name}"

  name_array << "#{f_name +" "+ l_name}"

  if name_array == name_array.uniq
    # puts "** Generating user #{f_name +" "+ l_name}"

    puts "   ** #{f_name +" "+ l_name}"
    user_photo_url = "https://res.cloudinary.com/dstl9dcq5/image/upload/v1566922525/Brad_mpmfwz.jpg"
    users << {
      first_name: f_name,
      last_name: l_name,
      user_location:      ['Universidade Lisboa', 'Universidade de São Paulo', 'Universidade Agustinho Neto', 'E.S.T.E.', 'SLB'].sample,
      password:           "123456",
      email:              "#{username}@mat3rial_unicorn.com",
      remote_photo_url: user_photo_url
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


puts 'Cleaning Items table...'
Item.destroy_all

puts 'Creating seeds Items...'
items = []

stationary_url = "https://res.cloudinary.com/dstl9dcq5/image/upload/v1566922180/Stationary_p3ikbs.jpg"
10.times {
  items << {
    description: ['beatuiful state', 'like new, 9.75 x 7.5', 'N/A', 'Black'].sample,
    category: Item::ITEM_TYPES.sample,
    price: "#{(rand * 10_000).floor / 100}",
    location: ['Universidade Lisboa', 'Universidade de São Paulo', 'Universidade Agustinho Neto', 'E.S.T.E.', 'SLB'].sample,
    user_id: User.all.sample.id,
    title: ['Staples Composition Notebook', 'Texas Instruments TI-84', 'Crayola® Crayons, 24/Box', 'Hammermill Copy Plus', 'Post-it® Super Sticky Notes'].sample,
    remote_photo_url: stationary_url
  }
}
Item.create!(items)
puts '>> Finished creating Items! <<'
puts 'Finished!'
