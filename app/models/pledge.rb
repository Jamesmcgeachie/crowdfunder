class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward
  has_one :project, through: :reward

  validate :amount_must_match_tier_value

  def amount_must_match_tier_value
  	unless self.amount == self.reward.tier_value
  		errors.add(:amount, "Pledge amount must match reward tier value")
  	end
  end

  def add_to_total
    this_project = self.project
  	this_project.total_raised += self.amount
    this_project.save
  end
end
