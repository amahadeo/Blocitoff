require 'faker'

# Create Users
5.times do 
  user = User.new(
    username: Faker::Internet.user_name,
    email:    Faker::Internet.email,
    password: Faker::Internet.password(10)
  )
  user.skip_confirmation!
  user.save!
end

# Create test profile
member = User.new(
  username: "member2015",
  email:    "member@letsblocitoff.com",
  password: "123456789"
)
member.skip_confirmation!
member.save!

users = User.all

# Create todos belonging to users
50.times do 
  Item.create!(
    name: Faker::Company.bs,
    user: users.sample
    )
  end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} todos created"