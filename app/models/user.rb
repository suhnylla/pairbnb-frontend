class User < ActiveRecord::Base
  include Clearance::User
  
  mount_uploader :avatar, AvatarUploader

  has_many :listings
  has_many :reservations
  has_many :authentications, dependent: :destroy

  enum role: [:customer, :moderator, :superadmin]

    def self.create_with_auth_and_hash(authentication, auth_hash)
      user = self.create!(
        first_name: auth_hash["name"],
        email: auth_hash["extra"]["raw_info"]["email"],
        password: SecureRandom.hex(5)
      )
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook').first
      return x.token unless x.nil?
    end
end
