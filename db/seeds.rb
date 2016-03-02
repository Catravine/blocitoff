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
items = Item.all

# Switch around created_at dates
items.each do |item|
  # NO tasks will be immidieately deleted on rake todo:delete_items
  item.update_attribute(:created_at, rand(7.days.ago..Time.now))
  # SOME tasks will be immidieately deleted on rake todo:delete_items
  #item.update_attribute(:created_at, rand(14.days.ago..Time.now))
  # ALL tasks will be immidieately deleted on rake todo:delete_items
  #item.update_attribute(:created_at, rand(14.days.ago..7.days.ago))
end

# Results
puts "Seed Finished..."
puts "#{User.count} users created"
puts "#{Item.count} items created"
