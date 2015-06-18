class User < ActiveRecord::Base
  require 'digest/md5'
  devise :database_authenticatable, :recoverable, :validatable
  after_create :update_access_token!  

  validates :username, presence: true
  validates :email, presence: true

  has_many :purchases

  def gravatar
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email.downcase)

    # compile URL which can be used in <img src="RIGHT_HERE"...
    "http://www.gravatar.com/avatar/#{hash}"
  end  

  private

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end
end
