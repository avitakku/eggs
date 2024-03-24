# app/models/user_information.rb
class UserInformation < ActiveRecord::Base
    serialize :friends, Array
    
    has_secure_password
  
    validate :validate_friends_array
    has_many :goods_and_services, foreign_key: 'user_id', primary_key: 'user_id'
  
    validates :contact_information, format: { with: /\A[^@\s]+@columbia\.edu\z/, message: "must be a Columbia email address" }
    validates :password, length: { minimum: 8 }, if: :password_required?
    
    def validate_friends_array
      return if friends.empty?
    
      # Check if all elements in the friends array are valid user IDs
      invalid_user_ids = friends.reject { |friend| UserInformation.exists?(user_id: friend) }
      if invalid_user_ids.any?
        errors.add(:friends, "contains invalid user IDs: #{invalid_user_ids.join(', ')}")
      end
    end
  
    private
  
    def password_required?
      new_record? || password.present?
    end
  end