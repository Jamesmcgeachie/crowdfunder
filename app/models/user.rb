class User < ActiveRecord::Base
  authenticates_with_sorcery!
	has_many :projects
	#has_many :backed_projects, through: :pledges, source: :project, class_name: "Project"
	has_many :pledges
	has_many :reviews


  has_many :rewards, through: :pledges
  has_many :backed_projects, through: :rewards, source: :project, class_name: "Project"
	
	# Below is how I'm trying to access a project object for the user profile
	# has_many :projects_pledged, through: :pledges, source:

	validates :password, length: { minimum: 3 }
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	validates :email, uniqueness: true
end
