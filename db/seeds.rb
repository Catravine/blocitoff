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

# Create To-Do lists
24.times do
  List.create(title: Faker::Company.buzzword, user: users.sample)
end
lists = List.all

# Create To-Do items
100.times do
  Item.create(name: Faker::Hacker.say_something_smart, list: lists.sample)
end
items = Item.all

# Switch around item/created_at dates randomly within the past week
items.each do |item|
  item.update_attribute(:created_at, rand(7.days.ago..Time.now))
end

# Results
puts "Seed Finished..."
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
