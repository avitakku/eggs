class UserInformation < ActiveRecord::Base
    serialize :friends, Array

    validate :validate_friends_array
    has_many :goods_and_services, foreign_key: 'user_id', primary_key: 'user_id'

  
    def validate_friends_array
        return if friends.empty?
      
        # Check if all elements in the friends array are valid user IDs
        invalid_user_ids = friends.reject { |friend| UserInformation.exists?(user_id: friend) }
        if invalid_user_ids.any?
          errors.add(:friends, "contains invalid user IDs: #{invalid_user_ids.join(', ')}")
        end
    end
  
  end