# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_information_data = [
  {
    user_id: '12345',
    username: 'agm2208',
    name: 'Aditi Mutagi'
    contact_information: 'agm2208@columbia.edu',
    address: '70 Morningside Dr.',
    rating: 4.5,
    friends: ['ag4049', 'jzm2103']
  },
  {
    user_id: '67890',
    username: 'ag4049',
    name: 'Avantika Garg'
    contact_information: 'ag4049@columbia.edu',
    address: '70 Morningside Dr.',
    rating: 2.2,
    friends: ['agm2208', 'jzm2103']
  },
  {
    user_id: '15842',
    username: 'jzm2103',
    name: 'Joshua Mei'
    contact_information: 'jzm2103@columbia.edu',
    address: '70 Morningside Dr.',
    rating: 3.2,
    friends: ['agm2208', 'ag4049']
  },
  {
    user_id: '94213',
    username: 'ar4179',
    name: 'Aryan Ray',
    contact_information: 'ar4179@columbia.edu',
    address: '70 Morningside Dr.',
    rating: 4.7,
    friends: []
  }
]

goods_and_services_data = [
  {
    user_id: 'agm2208',
    name: 'Bike',
    type: 0, # 0 for goods
    description: 'Mountain bike, 21 gears'
  },
  {
    user_id: 'agm2208',
    name: 'Tutoring',
    type: 1, # 1 for services
    description: 'Math and science tutoring'
  },
  {
    user_id: 'ag4049',
    name: 'Textbooks',
    type: 0,
    description: 'Various textbooks for sale'
  },
  {
    user_id: 'jzm2103',
    name: 'Laptop Repair',
    type: 1,
    description: 'Expert laptop repair services'
  },
  {
    user_id: 'ar4179',
    name: 'Mini Fridge',
    type: 0,
    description: 'Mini fridge, freezer, and microwave set'
  }
]

user_information_data.each do |user_info|
  UserInformation.create!(user_info)
end

goods_and_services_data.each do |item|
  GoodsAndService.create!(item)
end