# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)jabwf

puts 'Cleaning user table...'
User.destroy_all

puts 'Creating seeds users...'

users = []

users << {
    first_name: 'Aria',
    last_name: 'Star',
    user_location: 'Winterfel',
    password: '123456',
    email: 'ariastark@mat3rial_unicorn.com'
  }

puts "Creating user Aria Stark"

10.times {

  f_name = ['Joao', 'Antonio', 'Julius', 'Rita', 'Ijoline', 'Karim'].sample
  l_name = ['Muller', 'Laia', 'Ussene', 'Homphomsiltham', 'Oliveira', 'Fernandes', 'Sousa'].sample

  puts "Creating user #{f_name +" "+ l_name}"

  users << {
    first_name: f_name,
    last_name: l_name,
    user_location:      ['lisboa', 'rio de janeiro', 'luanda', 'estoril', 'benfica'].sample,
    password:           "123456",
    email:              "#{f_name + l_name}@mat3rial_unicorn.com"
  }
  puts "user created"
}
User.create!(users)
puts 'Finished!'
