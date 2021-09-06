require 'faker'
require 'open-uri'

##################################
#####    Seed The Program    #####
##################################
puts "---------------------------------------------"
puts "Cleaning database..."
Message.delete_all
Chatroom.delete_all
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

default_user_image = 'https://www.pngitem.com/pimgs/m/22-223968_default-profile-picture-circle-hd-png-download.png'
volunteer_bio = "New to Papaya, but really excited to be part of an amazing community of likeminded people and events. New to London and really interested in helping out with my local community. I love food 🍔"
organization_bio = "Looking for fun and motivated people, not afraid to throw themselves into the deepend! Let's fight injustice together 💪"

cesar = User.create(email: 'cesar@seed.com',
                    password: 'password',
                    first_name: 'Cesar',
                    last_name: 'Ades',
                    organization: false,
                    bio: volunteer_bio,
                    age: 19,
                    gender: 'male',
                    religion: 'jewish')
attach_photo(cesar, default_user_image)

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

alex = User.create(email: "alex@papaya.com",
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

eco_guys = User.create(email: "crisis@papaya.com",
                       password: 'password',
                       company_name: 'Crisis',
                       organization: true,
                       bio: organization_bio)
attach_photo(eco_guys, 'https://images.unsplash.com/photo-1518398046578-8cca57782e17?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')

battersea = User.create(email: "battersea@papaya.com",
                        password: 'password',
                        company_name: 'Battersea Dogs Home',
                        organization: true,
                        bio: organization_bio)
attach_photo(battersea, 'https://images.unsplash.com/photo-1616679911721-eff6eec18fcd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80')

cancer_research = User.create(email: "cancerresearch@papaya.com",
                              password: 'password',
                              company_name: 'Cancer Research',
                              organization: true,
                              bio: organization_bio)
attach_photo(cancer_research, 'https://images.unsplash.com/photo-1567427018141-0584cfcbf1b8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80')

gosh = User.create(email: "gosh@papaya.com",
                   password: 'password',
                   company_name: 'Great Ormond Street',
                   organization: true,
                   bio: organization_bio)
attach_photo(gosh, 'https://images.unsplash.com/photo-1606092195730-5d7b9af1efc5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80')

organizations = [oxfam, eco_guys, battersea, cancer_research, gosh]

puts "🎉 Success, users created!"
puts "---------------------------------------------"

###################################
#####     Creates Events      #####
###################################

puts "---------------------------------------------"
puts "Creating events..."

main_event = Event.create!(capacity: 20,
                           description: "Looking for a motivated and enthusiastic individual to help clean up our Hackney streets!",
                           category: 'Environment',
                           address: Faker::Address.full_address,
                           latitude: 51.5734,
                           longitude: 0.0724,
                           start_time: DateTime.now + 20,
                           end_time: DateTime.now + 31,
                           name: "Plastic-Free Hackney",
                           user: eco_guys)
attach_photo(main_event, 'https://images.unsplash.com/photo-1595278069441-2cf29f8005a4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80')

secondary_event = Event.create!(capacity: 10,
                                description: "Looking for a happy, joyful individual to come the bin men of East London",
                                category: 'Environment',
                                address: Faker::Address.full_address,
                                latitude: 51.4722,
                                longitude: 0.1655,
                                start_time: DateTime.now + 20,
                                end_time: DateTime.now + 31,
                                name: "Hackney Clean Up",
                                user: gosh)
attach_photo(secondary_event, 'https://images.unsplash.com/photo-1610141160723-d2d346e73766?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')

latitude = [51.4923, 51.4991, 51.5556, 51.6134, 51.3762, 51.5168, 51.5452, 51.6565, 51.4613, 51.5398]
longitude = [0.0652, 0.1938, 0.1762, 0.2464, 0.0982, 0.4368, 0.0749, 0.3903, 0.1156, 0.1985]

10.times do
  event = Event.create!(capacity: rand(1..20),
                        description: Faker::Fantasy::Tolkien.poem,
                        category: ['Health', 'Education', 'Animals', 'Community', 'Children', 'Faith', 'Women', 'Shelters', 'LGBTQ', 'Sport', 'Environment', 'Food', 'Other'].sample,
                        address: "#{rand(1..100)} Hackney Street, London",
                        latitude: latitude.sample,
                        longitude: longitude.sample,
                        start_time: DateTime.now + 30,
                        end_time: DateTime.now + 41,
                        name: Faker::Book.title,
                        user: organizations.sample)
  attach_photo(event, 'https://source.unsplash.com/random')
end

puts "🎉 Success, events created!"
puts "---------------------------------------------"
