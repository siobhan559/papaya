require 'faker'
require 'open-uri'

##################################
#####    Seed The Program    #####
##################################
LOREM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
puts "---------------------------------------------"
puts "Cleaning database..."
Booking.delete_all
Event.delete_all
User.delete_all
puts "🎉 Success!"
puts "---------------------------------------------"

#################################
#####     Helper Method     #####
#################################

def attach_photo(object, url)
  file = URI.open(url)
  object.photo.attach(io: file, filename: 'image.png', content_type: 'image/png')
end

###################################
#####     Creates Users       #####
###################################
puts "---------------------------------------------"
puts "Creating users..."

volunteer_bio = "New to Papaya, but really excited to be part of an amazing community of likeminded people and events. New to London and really interested in helping out with my local community. I love food 🍔"
organization_bio = "Looking for fun and motivated people, not afraid to throw themselves into the deepend! Let's fight injustice together 💪"

cesar = User.create(email: 'cesar@seed.com',
                    password: 'password',
                    first_name: 'Cesar',
                    last_name: 'Ades',
                    organization: false,
                    bio: 'Learn to code, change your life!',
                    age: 19,
                    gender: 'male',
                    religion: 'jewish')
attach_photo(cesar, 'https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80')

helen = User.create(email: Faker::Internet.email,
                    password: 'password',
                    first_name: 'Helen',
                    last_name: 'Heart',
                    organization: false,
                    bio: volunteer_bio,
                    age: 21,
                    gender: 'female',
                    religion: 'athiest')
attach_photo(helen, 'https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80')

alex = User.create( email: "alex@papaya.com",
                    password: 'password',
                    first_name: 'Alex',
                    last_name: 'Anchor',
                    organization: false,
                    bio: volunteer_bio,
                    age: 35,
                    gender: 'male',
                    religion: 'athiest')
attach_photo(alex, 'https://images.unsplash.com/photo-1587482283211-89bcb00079a8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=598&q=80')

oxfam = User.create(email: "oxfam@papaya.com",
                    password: 'password',
                    company_name: 'Oxfam',
                    organization: true,
                    bio: organization_bio)
attach_photo(oxfam, 'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')

crisis = User.create( email: "crisis@papaya.com",
                      password: 'password',
                      company_name: 'Crisis',
                      organization: true,
                      bio: organization_bio)
attach_photo(crisis, 'https://images.unsplash.com/photo-1518398046578-8cca57782e17?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')

red_cross = User.create(email: "redcross@papaya.com",
                        password: 'password',
                        company_name: 'Red Cross',
                        organization: true,
                        bio: organization_bio)
attach_photo(red_cross, 'https://images.unsplash.com/photo-1616679911721-eff6eec18fcd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80')

cancer_research = User.create(email: "cancerresearch@papaya.com",
                              password: 'password',
                              company_name: 'Cancer Research',
                              organization: true,
                              bio: organization_bio)
attach_photo(cancer_research, 'https://images.unsplash.com/photo-1567427018141-0584cfcbf1b8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80')

gosh = User.create( email: "gosh@papaya.com",
                    password: 'password',
                    company_name: 'Great Ormond Street',
                    organization: true,
                    bio: organization_bio)
attach_photo(gosh, 'https://images.unsplash.com/photo-1606092195730-5d7b9af1efc5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80')

organizations = [oxfam, crisis, red_cross, cancer_research, gosh]

puts "🎉 Success, users created!"
puts "---------------------------------------------"

###################################
#####     Creates Events      #####
###################################

puts "---------------------------------------------"
puts "Creating events..."

main_event = Event.create!( capacity: 20,
                            description: "Plastic-Free Hackney Monthly Pollution Pick",
                            category: 'Community',
                            recurrence_times: 4,
                            recurrence_frequency: 'weeks',
                            address: Faker::Address.full_address,
                            latitude: Faker::Address.latitude,
                            longitude: Faker::Address.longitude,
                            start_time: DateTime.now + 20,
                            end_time: DateTime.now + 31,
                            name: "Plastic-Free Hackney",
                            user: crisis)
attach_photo(main_event, 'https://images.unsplash.com/photo-1595278069441-2cf29f8005a4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80')

20.times do
  event = Event.create!(capacity: rand(1..20),
                        description: Faker::Fantasy::Tolkien.poem,
                        category: ['Health', 'Education', 'Animals', 'Community', 'Children', 'Faith', 'Women', 'Shelters', 'LGBTQ', 'Sport', 'Food', 'Other'].sample,
                        recurrence_times: rand(1..4),
                        recurrence_frequency: ['days', 'weeks', 'months'].sample,
                        address: Faker::Address.full_address,
                        latitude: Faker::Address.latitude,
                        longitude: Faker::Address.longitude,
                        start_time: DateTime.now + 10,
                        end_time: DateTime.now + 11,
                        name: Faker::Book.title,
                        user: organizations.sample)
  attach_photo(event, 'https://source.unsplash.com/random')
end

puts "🎉 Success, events created!"
puts "---------------------------------------------"
