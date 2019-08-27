# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning user table...'
User.destroy_all

puts 'Creating seeds users...'

users = []

10.times {

  f_name = ['Joao', 'Antonio', 'Julius', 'Rita', 'Ijoline', 'Karim'].sample
  l_name = ['Muller', 'Laia', 'Ussene', 'Homphomsiltham'].sample

  users << {
    first_name: f_name,
    last_name: l_name,
    user_location:      ['lisboa', 'rio de janeiro', 'luanda', 'estoril', 'benfica'].sample,
    password:           "111111",
    email:              "#{f_name + l_name}@mat3rial_unicorn.com"

  }
}
User.create!(users)
puts 'Finished!'
