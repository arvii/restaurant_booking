class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll
  belongs_to :restaurant

  validates_uniqueness_of :user_id, scope: [:poll_id, :restaurant_id]
end
