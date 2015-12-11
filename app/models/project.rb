class Project < ActiveRecord::Base
  mount_uploader :project_image, ImageUploader
  belongs_to :user
  has_many :rewards
  has_many :reviews
  has_many :pledges, through: :rewards

  validates :name, :description, :funding_goal, :start_date, :end_date, presence: true

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  def total_raised
    self.pledges.sum :amount
  end

  def time_left
  	if project_ongoing
	  	days = ((self.end_date - Time.now) / 86400).floor
	  	hours = (((self.end_date - Time.now) / 3600) - (days * 24)).floor
			return "#{days} days"
		else
			return "Backing period has ended."
		end
  end

  def is_funded?
  	unless project_ongoing
  		(self.total_raised >= self.funding_goal) ? "Project was funded! :)" : "Project was not funded. :("
  	end
  end

  private

  def project_ongoing
  	(self.end_date - Time.now) > 0
  end


end
