class Poll < ApplicationRecord
	belongs_to :user, foreign_key: "started_by"
end
