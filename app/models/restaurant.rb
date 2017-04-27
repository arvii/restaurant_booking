class Restaurant < ApplicationRecord
	belongs_to :user, foreign_key: 'suggested_by_user_id'
end
