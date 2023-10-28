user_information_data = [
  {
    user_id: '12345',
    username: 'agm2208',
    name: 'Aditi Mutagi',
    contact_information: 'agm2208@columbia.edu',
    address: '70 Morningside Dr.',
    rating: 4.5,
    friends: ['67890', '15842']
  },
  {
    user_id: '67890',
    username: 'ag4049',
    name: 'Avantika Garg',
    contact_information: 'ag4049@columbia.edu',
    address: '70 Morningside Dr.',
    rating: 2.2,
    friends: ['12345', '15842']
  },
  {
    user_id: '15842',
    username: 'jzm2103',
    name: 'Joshua Mei',
    contact_information: 'jzm2103@columbia.edu',
    address: '70 Morningside Dr.',
    rating: 3.2,
    friends: ['12345', '67890']
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
    user_id: '12345',
    name: 'Bike',
    category: 0, # 0 for goods
    description: 'Mountain bike, 21 gears'
  },
  {
    user_id: '12345',
    name: 'Tutoring',
    category: 1, # 1 for services
    description: 'Math and science tutoring'
  },
  {
    user_id: '67890',
    name: 'Textbooks',
    category: 0,
    description: 'Various textbooks for sale'
  },
  {
    user_id: '15842',
    name: 'Laptop Repair',
    category: 1,
    description: 'Expert laptop repair services'
  },
  {
    user_id: '94213',
    name: 'Mini Fridge',
    category: 0,
    description: 'Mini fridge, freezer, and microwave set'
  }
]

# First, create each UserInformation entry without the friends attribute
user_information_data.each do |user_info|
    UserInformation.create!(
      user_id: user_info[:user_id],
      username: user_info[:username],
      name: user_info[:name],
      contact_information: user_info[:contact_information],
      address: user_info[:address],
      rating: user_info[:rating],
      friends: []  # initialize with empty array
    )
  end
  
  # Then, update the friends attribute for each user
  user_information_data.each do |user_info|
    user = UserInformation.find_by(username: user_info[:username])
  
    # Validate the friends IDs
    valid_friends = user_info[:friends].select do |friend_id|
      UserInformation.exists?(user_id: friend_id)
    end
  
    if valid_friends.length == user_info[:friends].length
      user.update!(friends: valid_friends)
    else
      invalid_friends = user_info[:friends] - valid_friends
      puts "Warning: Invalid friends IDs for user #{user_info[:username]}: #{invalid_friends.join(', ')}"
    end    
  end
  
  # Finally, create GoodsAndService entries
  goods_and_services_data.each do |item|
    GoodsAndService.create!(item)
  end
  