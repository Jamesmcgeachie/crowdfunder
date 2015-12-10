class Project < ActiveRecord::Base
  belongs_to :user
  has_many :rewards

  validates :name, :description, :funding_goal, :start_date, :end_date, presence: true

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  # Is there a more efficient method of doing this?
  def project_total
  	total = 0
  	self.rewards.each do |reward|
  		reward.pledges.each do |pledge|
  			total += pledge.amount
  		end
  	end
  	return total
  end

  def time_left
  	if project_ongoing
	  	days = ((self.end_date - Time.now) / 86400).floor
	  	hours = (((self.end_date - Time.now) / 3600) - (days * 24)).floor
			return "#{days} days and #{hours} hours"
		else
			return "Backing period has ended."
		end
  end

  def is_funded?
  	unless project_ongoing
  		(self.project_total >= self.funding_goal) ? "Project was funded! :)" : "Project was not funded. :("
  	end
  end

  private

  def project_ongoing
  	(self.end_date - Time.now) > 0
  end


end
