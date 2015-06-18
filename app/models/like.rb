class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase
  validates_uniqueness_of :user, scope: 'purchase_id'
end
