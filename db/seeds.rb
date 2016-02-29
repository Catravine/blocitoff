# Create Users
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "helloworld",
    password_confirmation: "helloworld",
    confirmed_at: Date.today
  )
end

# Create a user for my primary email
User.create!(
  email: "caroline@carolinecourtney.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  confirmed_at: Date.today
)

# Create a user for my secondary email
User.create!(
  email: "catravine@hotmail.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  confirmed_at: Date.today
)

# Total Users
users = User.all

# Create To-Do items
50.times do
  Item.create(name: Faker::Hacker.say_something_smart, user: users.sample)
end

# Results
puts "Seed Finished..."
puts "#{User.count} users created"
puts "#{Item.count} items created"
