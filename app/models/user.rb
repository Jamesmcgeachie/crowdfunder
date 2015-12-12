class User < ActiveRecord::Base
  authenticates_with_sorcery!
	has_many :projects
	has_many :pledges
	has_many :reviews
  has_many :rewards, through: :pledges
  has_many :backed_projects, through: :rewards, source: :project, class_name: "Project"


	validates :password, length: { minimum: 3 }
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	validates :email, uniqueness: true

	def total_pledged(project)
		project_rewards = self.rewards.where(project: project)
		return self.pledges.where(reward: project_rewards).sum(:amount)
	end
end
