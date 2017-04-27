class User < ApplicationRecord
	extend Devise::Models

	# has_many :polls, dependent: :destroy
	has_many :polls, dependent: :destroy, foreign_key: 'started_by_user_id'

  # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
