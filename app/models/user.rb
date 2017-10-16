class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :photos
  has_many :comments
  has_one :username
  
  def init_profile
  self.create_profile!
  end

  #getting user to create a profile after login
  after_create :create_profile
  has_one :profile

  acts_as_voter
end
