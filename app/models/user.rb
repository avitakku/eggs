class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :user_information, dependent: :destroy
  accepts_nested_attributes_for :user_information
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # ensure users have Columbia email address
  validates :email, format: { with: /\A[^@\s]+@columbia\.edu\z/i, message: 'must be a Columbia email' }

  before_create :generate_user_id

  private

  def generate_user_id
    self.build_user_information(user_id: SecureRandom.uuid)
  end

end
