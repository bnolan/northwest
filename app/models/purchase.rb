class Purchase < ActiveRecord::Base
  scope :feed, -> (lat, long) { order('created_at desc').all }
  has_many :likes, :dependent => :destroy
  belongs_to :user

  def as_json(*args)
    detailed = args.first[:detailed].present?

    attributes.merge({
      user: { username: user.username, avatar: user.gravatar },
      venue: { name: 'Apple Store', address: '567 George St.' },
      likes: detailed ? likes : likes.collect { |l| l.user.username }
    })
  end

end
