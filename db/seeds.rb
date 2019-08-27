# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


# creates an Aria Stark user plus 10 random users
# if a seeding fails it is due to repetition in the email (having mutiple exact same names)

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

  puts "** Generating user #{f_name +" "+ l_name}"

  users << {
    first_name: f_name,
    last_name: l_name,
    user_location:      ['Universidade Lisboa', 'Universidade de São Paulo', 'Universidade Agustinho Neto', 'E.S.T.E.', 'SLB'].sample,
    password:           "123456",
    email:              "#{f_name + l_name}@mat3rial_unicorn.com"
  }
  puts "<< user added"
}
puts "if a seeding fails it is due to repetition in the email (having mutiple exact same names)"
User.create!(users.uniq!)
puts 'Finished!'
