class User < ActiveRecord::Base
  authenticates_with_sorcery!
	has_many :projects
	has_many :pledges
	has_many :reviews
	
	# Below is how I'm trying to access a project object for the user profile
	# has_many :projects_pledged, through: :pledges, source:

	validates :password, length: { minimum: 3 }
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	validates :email, uniqueness: true
end
