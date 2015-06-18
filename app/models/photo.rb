class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "640x640", :thumb => "160x160>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
