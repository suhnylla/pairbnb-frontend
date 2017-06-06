class Listing < ActiveRecord::Base
  mount_uploaders :photos, PhotosUploader
  serialize :photos, JSON
  belongs_to :user
  has_many :reservations
end
