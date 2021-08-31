##################################
#####    Seed The Program    #####
##################################
LOREM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
puts "---------------------------------------------"
puts "Cleaning database..."
User.delete_all
Event.delete_all
Booking.delete_all
puts "🎉 Success!"
puts "---------------------------------------------"

user = User.new(
  email: 'test@test.com',
  password: 'password'
)
user.save!

10.times do
  Event.create(
    category: ['Shelter', '5K', 'Charity'].sample,
    description: LOREM,
    user: user
  )
end
