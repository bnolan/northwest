class Purchase < ActiveRecord::Base
  scope :feed, -> (lat, long) { order('created_at desc').limit(20).all }
  has_many :likes, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  belongs_to :user

  def as_json(*args)
    detailed = args.first[:detailed].present?

    attrs = attributes.merge({
      user: { username: user.username, avatar: user.gravatar },
      venue: { name: 'Apple Store', address: '567 George St.' },
      likes: detailed ? likes : likes.collect { |l| l.user.username }
    })
    attrs.merge!(photos: photos) if detailed
    attrs
  end

  scope :for_user, ->(user) {
    where(user_id: user.id)
  }
end
