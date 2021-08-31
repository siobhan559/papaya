require 'faker'

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

#################################
#####     Helper Method     #####
#################################

def attach_photo(object, url, item = true)
  file = URI.open(url)
  if item
    object.photos.attach(io: file, filename: 'image.png', content_type: 'image/png')
  else
    object.photo.attach(io: file, filename: 'image.png', content_type: 'image/png')
  end
end

###################################
#####     Creates Users       #####
###################################
puts "---------------------------------------------"
puts "Creating users..."

helen = User.new(email: Faker::Internet.email, password: 'password', first_name: 'Helen', last_name: 'Heart', organization?: false, bio: Faker::Movies::PrincessBride.quote, age: 21, gender: 'female', religion: 'athiest')
attach_photo(helen, 'https://unsplash.com/photos/aoQ4DYZLE_E', false)

oxfam = User.new(email: Faker::Internet.email, password: 'password', company_name: 'Oxfam', organization?: true, bio: Faker::Movies::PrincessBride.quote)
attach_photo(oxfam, 'https://unsplash.com/photos/AEaTUnvneik', false)

puts "🎉 Success, users created!"
puts "---------------------------------------------"

###################################
#####     Creates Events      #####
###################################

puts "---------------------------------------------"
puts "Creating events..."
puts "---------------------------------------------"

cooking = Event.create(capacity: rand(1..20),
                      description: Faker::Movies::PrincessBride.quote,
                      category: "Food",
                      recurrence_times: rand(1..4),
                      recurrence_frequency: ['days', 'weeks', 'months'].sample,
                      address: Faker::Address.full_address,
                      lat: Faker::Address.latitude,
                      long: Faker::Address.longitude,
                      start_time: Faker::Date.backward(days: 14),
                      end_time: Faker::Date.backward(days: 14),
                      name: "Cook Together")
attach_photo(cooking, 'https://images.unsplash.com/photo-1604332790652-b431be0cf9af?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y29va2luZyUyMHNjaG9vbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60')

food_kitchen = Event.create(capacity: rand(1..20),
                            description: Faker::Movies::PrincessBride.quote,
                            category: ["Food", "Shelter"],
                            recurrence_times: rand(1..4),
                            recurrence_frequency: ['days', 'weeks', 'months'].sample,
                            address: Faker::Address.full_address,
                            lat: Faker::Address.latitude,
                            long: Faker::Address.longitude,
                            start_time: Faker::Date.backward(days: 14),
                            end_time: Faker::Date.backward(days: 14),
                            name: "Food Kitchen")
attach_photo(food_kitchen, 'https://unsplash.com/photos/qPcSUERqBAc')

womens = Event.create(capacity: rand(1..20),
                      description: Faker::Movies::PrincessBride.quote,
                      category: ["women", "shelter"],
                      recurrence_times: nil,
                      address: Faker::Address.full_address,
                      lat: Faker::Address.latitude,
                      long: Faker::Address.longitude,
                      start_time: Faker::Date.backward(days: 14),
                      end_time: Faker::Date.backward(days: 14),
                      name: "Women's Shelter")
attach_photo(womens, 'https://unsplash.com/photos/u5e1kqW6E3M')

bible = Event.create(capacity: rand(1..20),
                    description: Faker::Movies::PrincessBride.quote,
                    category: ["faith", "education"],
                    recurrence_times: rand(1..4),
                    recurrence_frequency: ['days', 'weeks', 'months'].sample,
                    address: Faker::Address.full_address,
                    lat: Faker::Address.latitude,
                    long: Faker::Address.longitude,
                    start_time: Faker::Date.backward(days: 14),
                    end_time: Faker::Date.backward(days: 14),
                    name: "Bible with Us")
attach_photo(bible, 'https://unsplash.com/photos/DRgrzQQsJDA')

puts "🎉 Success, events created!"
puts "---------------------------------------------"
