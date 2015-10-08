# Create Users
3.times do
    user = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(8)
    )
    user.skip_confirmation!
    user.save!
end

users = User.all

# Create a member
member = User.new(
    name: 'Member User',
    email: 'member@example.com',
    password: 'helloworld'
)
member.skip_confirmation!
member.save!

# Create Registered Application
5.times do
    RegisteredApplication.create!(
        user: users.sample,
        name: Faker::Lorem.word,
        url: Faker::Internet.url
    )
end

registered_applications = RegisteredApplication.all

registered_applications.each do | registered_application |
    # Create Events
    Event.create!(
        registered_application: registered_application,
        user_id: registered_application.user_id,
        name: "Level 1"
    )

    Event.create!(
        registered_application: registered_application,
        user_id: registered_application.user_id,
        name: "Level 2"
    )

    Event.create!(
        registered_application: registered_application,
        user_id: registered_application.user_id,
        name: "Level 3"
    )

    Event.create!(
        registered_application: registered_application,
        user_id: registered_application.user_id,
        name: "Level 4"
    )

    Event.create!(
        registered_application: registered_application,
        user_id: registered_application.user_id,
        name: "Level 5"
    )
end

puts "#{User.count} users created"
puts "#{RegisteredApplication.count} applications created"
puts "#{Event.count} events created"