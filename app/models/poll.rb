class Poll < ApplicationRecord
  belongs_to :user, class_name: User, foreign_key: 'started_by_user_id'
end
