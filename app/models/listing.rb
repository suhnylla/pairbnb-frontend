class Listing < ActiveRecord::Base
  mount_uploaders :photos, PhotosUploader
  serialize :photos, JSON
  belongs_to :user
  has_many :reservations

  # scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }

  # def self.most_recent(limit)
 	#  order("created_at desc").limit(limit)
  # end

end
