class UserInformation < ActiveRecord::Base
    validates :friends, presence: true
    validate :validate_friends_array
  
    # Custom validation method to check the contents of the friends array
    def validate_friends_array
      return if friends.nil?
  
      # Check if all elements in the friends array are valid user IDs
      invalid_user_ids = friends.reject { |friend| UserInformation.exists?(user_id: friend) }
      if invalid_user_ids.any?
        errors.add(:friends, "contains invalid user IDs: #{invalid_user_ids.join(', ')}")
      end
    end
  
    # ... other model code ...
  end
  