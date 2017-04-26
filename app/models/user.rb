class User < ApplicationRecord
	extend Devise::Models

	has_many :polls, dependent: :destroy

  # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
