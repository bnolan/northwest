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

  # def to_json(*args)
  #   result = attributes

  #   if args[:detailed]
  #     result.

  # def self.feed(*args)
  #   all
  #   # [
  #   #   { name: 'Lamborghini Murcielago', likes: ['mary', 'john', 'dave'], created_at: '2015-06-16T17:47:43+12:00', user: { name: 'ben' }, venue: { name: 'apple store' } }
  #   #   # { name: 'Apple Watch Sport', likes: ['ristari', 'mary', 'dave'], created_at: '2015-06-16T17:47:43+12:00', user: { name: 'captainbenis' }, photo: 'applewatch.jpg', store:
  #   #   #   { name: 'Apple Store, Sydney', address: '367 George Street' }
  #   #   # },
  #   #   # { name: 'Macbook', likes: [], created_at: '2015-06-16T17:47:43+12:00', user: { name: 'captainbenis' }, photo: 'macbook.jpg', store:
  #   #   #   { name: 'Apple Store, Sydney', address: '367 George Street' }
  #   #   # },
  #   #   # { name: 'District personal message bag', likes: ['captainbenis'], created_at: '2015-06-16T17:47:43+12:00', user: { name: 'ristari' }, photo: 'bag.png', store:
  #   #   #   { name: 'Louis Vuitton', address: '365 George St' }
  #   #   # }
  #   # ]
  # end
end
