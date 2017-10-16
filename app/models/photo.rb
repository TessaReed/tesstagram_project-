class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments
  acts_as_votable
  include ImageUploader::Attachment.new(:image)
end
