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
attach_photo(cesar, "https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80")

siobhan = User.create(email: 'siobhan@seed.com',
                    password: 'password',
                    first_name: 'Siobhan',
                    last_name: 'Brown',
                    organization: false,
                    bio: "I live in London and am looking to get more involved in the community around me. Particularly interested in helping out with anything food related, also looking after the environment.",
                    age: 30)
attach_photo(siobhan, "https://images.unsplash.com/photo-1582610285985-a42d9193f2fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=668&q=80")

george = User.create(email: 'george@seed.com',
                    password: 'password',
                    first_name: 'George',
                    last_name: 'Kelly',
                    organization: false,
                    bio: "Hi, I'm George. I'm from East London and have been tired of seeing litter all over the streets around my house, so I'm especially interested in finding events near me to organise a clean up!",
                    age: 28)
attach_photo(george, "https://images.unsplash.com/photo-1583864697784-a0efc8379f70?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80")

daniella = User.create(email: 'daniella@seed.com',
                    password: 'password',
                    first_name: 'Daniella',
                    last_name: 'Fernandes',
                    organization: false,
                    bio: "Can't wait to get involved in some of these events, and meet people near me who want to make London a better place!",
                    age: 28,
                    gender: 'female')
attach_photo(daniella, "https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80")

hazel = User.create(email: 'hazel@seed.com',
                    password: 'password',
                    first_name: 'Hazel',
                    last_name: 'Hart',
                    organization: false,
                    bio: "New to London, would love to get involved in some events and volunteering in my local community. London is huge so if Papaya can connect me with some other people who feel the same that would be great as well!",
                    age: 24,
                    gender: 'female')
attach_photo(hazel, "https://images.unsplash.com/photo-1599842057874-37393e9342df?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80")

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

foodcycle = User.create(email: "foodcycle@papaya.com",
                    password: 'password',
                    company_name: 'Food Cycle',
                    organization: true,
                    bio: "We aim to make food poverty, loneliness and food waste a thing of the past for every community. Week in, week out we nourish the hungry and lonely in our communities with delicious meals and great conversation, using food which would otherwise go to waste.")
attach_photo(foodcycle, 'https://images.unsplash.com/photo-1599059813005-11265ba4b4ce?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')

oxfam = User.create(email: "oxfam@papaya.com",
                    password: 'password',
                    company_name: 'Oxfam',
                    organization: true,
                    bio: "Oxfam is a global movement of millions of people who share the belief that, in a world rich in resources, poverty isn't inevitable. In just 15 years, extreme poverty has been halved. 15 more years and we can end it for good. Oxfam's supporters make our vital work with some of the world's poorest communities possible. We can’t do it without you.")
attach_photo(oxfam, 'https://images.unsplash.com/photo-1608535002897-27b2aa592456?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80')

crisis = User.create(email: "crisis@papaya.com",
                       password: 'password',
                       company_name: 'Crisis',
                       organization: true,
                       bio: "We work directly with thousands of homeless people every year. We provide vital help so that people can rebuild their lives and are supported out of homelessness for good. Together with homeless people and Crisis supporters, we campaign for the changes needed to end homelessness for good.")
attach_photo(crisis, 'https://images.unsplash.com/photo-1533625655932-73abd53515b2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')

battersea = User.create(email: "battersea@papaya.com",
                        password: 'password',
                        company_name: 'Battersea Dogs Home',
                        organization: true,
                        bio: "Battersea is here for every dog and cat, and has been since 1860. We believe that every dog and cat deserves the best. That's why we help every dog and cat in need – whether it's newly born or getting on, cute or cute in its own way. Together with our staff, foster carers and volunteers are an integral part of the Battersea family, giving our centres and our animals the gift of their time and knowledge and enabling our charity to aspire to even greater things. We could not exist without them.")
attach_photo(battersea, 'https://images.unsplash.com/photo-1529472119196-cb724127a98e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=642&q=80')

cancer_research = User.create(email: "cancerresearch@papaya.com",
                              password: 'password',
                              company_name: 'Cancer Research',
                              organization: true,
                              bio: "Our teams of event volunteers and staff love what they do! No event day is the same and no matter which event or role you choose, we're sure you'll have lots of fun meeting some fantastic people whilst supporting our cause. Each year over 700,000 people join the fight against cancer by taking part in an event and fundraising in aid of Cancer Research UK, they can’t cross the finish line without the passion and energy of an amazing team of volunteers, like you!")
attach_photo(cancer_research, 'https://images.unsplash.com/photo-1583912267670-6575ad472688?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1284&q=80')

gosh = User.create(email: "gosh@papaya.com",
                   password: 'password',
                   company_name: 'Great Ormond Street Hospital',
                   organization: true,
                   bio: "Every day brings new challenges at Great Ormond Street Hospital (GOSH). Every day, 619 children and young people from across the UK arrive for life-changing treatments. Despite the greatest challenges a child can face, the hospital is a place where being sick does not always mean being sad. And it’s a place where you’ll find – today and every day – some of the bravest people you could ever meet. This extraordinary hospital has always depended on charitable support, and every day is a chance for you to make a difference.")
attach_photo(gosh, 'https://images.unsplash.com/photo-1502740479091-635887520276?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1349&q=80')

london = User.create(email: "eastlondoneco@papaya.com",
                   password: 'password',
                   company_name: 'East London Eco Team',
                   organization: true,
                   bio: "Here at the East London Eco Team, we are on a mission to make the streets, parks and communities we love cleaner! Not only do we organise litter picking teams, we also sort all litter into recycling, because we believe this is the way to make London, and the world, a greener place for future. We are always looking for volunteers, so check out our upcoming events!")
attach_photo(london, 'https://images.unsplash.com/photo-1611284446314-60a58ac0deb9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')

organizations = [oxfam, crisis, battersea, cancer_research, gosh, foodcycle, london]

puts "🎉 Success, users created!"
puts "---------------------------------------------"

###################################
#####     Creates Events      #####
###################################

puts "---------------------------------------------"
puts "Creating events..."

main_event = Event.create!(capacity: 20,
                           description: "Looking for motivated and enthusiastic individuals to help clean up our Hackney streets! Want to team up and join us for the afternoon litter picking? Victoria Park is one of the best in London, but we've noticed over the recent weeks a build-up of rubbish all across the park. We will provide pickers, gloves and binbags, all we ask is our volunteers come eager to help us clean up!",
                           category: 'Environment',
                           address: "259 Victoria Park Road, London",
                           start_time: DateTime.now + 5,
                           end_time: DateTime.now + 6,
                           name: "Plastic-Free Hackney",
                           user: london)
attach_photo(main_event, 'https://images.unsplash.com/photo-1595278069441-2cf29f8005a4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80')

secondary_event = Event.create!(capacity: 10,
                                description: "Looking for a happy, joyful individual to come and help the bin men of East London",
                                category: 'Environment',
                                address: "210 Cambridge Heath Road, London",
                                start_time: DateTime.now + 20,
                                end_time: DateTime.now + 31,
                                name: "Hackney Clean Up",
                                user: gosh)
attach_photo(secondary_event, 'https://images.unsplash.com/photo-1610141160723-d2d346e73766?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')

food_event = Event.create!(capacity: 10,
                                description: "Week in, week out, our team of incredible volunteers make wholesome meals from food that would have otherwise gone to waste. It is then shared with the community in a safe, welcoming space, where everyone is welcome, no questions asked. Roll your sleeves up, sport a fetching hairnet and join the kitchen team to produce a three-course vegetarian meal. You’ll be peeling, chopping, frying, mixing, boiling, serving and washing up. But most of all, you’ll have a lot of fun. You don’t need to have any previous cooking experience, you just need to get stuck in!",
                                category: 'Food',
                                address: "New Covent Garden Market, London",
                                start_time: DateTime.now + 11,
                                end_time: DateTime.now + 12,
                                name: "Big Community Cook",
                                user: foodcycle)
attach_photo(food_event, 'https://images.unsplash.com/photo-1597362925123-77861d3fbac7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')

race_event = Event.create!(capacity: 350,
                                description: "This is a 5k like no other. This is thousands of people uniting with one purpose. They're not races, or runs, and everyone wins the Race for Life (except cancer). Come join us for a fun day while raising money for Cancer Research at the same time!",
                                category: 'Sport',
                                address: "Hackney Marshes, London",
                                start_time: DateTime.now + 3.5,
                                end_time: DateTime.now + 4,
                                name: "Race for Life 5k",
                                user: cancer_research)
attach_photo(race_event, 'https://images.unsplash.com/photo-1613936360976-8f35cf0e5461?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80')

# latitude = [51.4923, 51.4991, 51.5556, 51.6134, 51.3762, 51.5168, 51.5452, 51.6565, 51.4613, 51.5398]
# longitude = [0.0652, 0.1938, 0.1762, 0.2464, 0.0982, 0.4368, 0.0749, 0.3903, 0.1156, 0.1985]

10.times do
  event = Event.create!(capacity: rand(1..50),
                        description: Faker::Fantasy::Tolkien.poem,
                        category: %w[Health Education Animals Community Children Environment Faith Women Shelter LGBTQ Food Sport Other].sample,
                        address: "#{rand(1..100)} Hackney Street, London",
                        start_time: DateTime.now + 30,
                        end_time: DateTime.now + 41,
                        name: Faker::Book.title,
                        user: organizations.sample)
  attach_photo(event, 'https://source.unsplash.com/random')
end

puts "🎉 Success, events created!"
puts "---------------------------------------------"
