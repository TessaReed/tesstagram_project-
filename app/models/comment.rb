class Comment < ApplicationRecord
  belongs_to :user
  validates :user, presence: true 
  belongs_to :photo, optional: true
end
