require 'faker'

# Create Users
10.times do 
  user = User.new(
      username: Faker::Name.name,
      email:    Faker::Internet.email,
      password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Lists
20.times do
  List.create!(
      user:         users.sample,
      title:        Faker::Lorem.sentence,
      description:  Faker::Lorem.paragraph
    )
end
lists = List.all

# Create Todos
50.times do
  todo = Todo.create!(
      description: Faker::Lorem.paragraph,
      list: lists.sample
    )
  todo.update_attributes!(created_at: rand(10.minutes .. 6.days).ago)
end


# Create an admin user
admin = User.new(
  username:  'AdminUser',
  email:    'admin@example.com',
  password: 'helloworld'
)
admin.skip_confirmation!
admin.save!

# Create Brock
brock = User.new(
  username:  'brock',
  email:    'brockcooper@gmail.com',
  password: 'helloworld'
)
brock.skip_confirmation!
brock.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Todo.count} todos created"