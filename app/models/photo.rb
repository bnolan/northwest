class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "640x640", :thumb => "160x160>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :purchase

  scope :visible_to, ->(user) {
    if user
      joins(:purchase).merge(Purchase.for_user(user))
    else
      where("not #{table_name}.private")
    end
  }
end
