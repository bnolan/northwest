class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase
  validates_uniqueness_of :user, scope: 'purchase_id'

  def as_json(*args)
    attributes.merge({
      user: { username: user.username, avatar: user.gravatar }
    })
  end
end
