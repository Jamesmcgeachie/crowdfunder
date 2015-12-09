class Project < ActiveRecord::Base
  belongs_to :user
  has_many :rewards

  validates :name, :description, :funding_goal, :start_date, :end_date, presence: true

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true
end
