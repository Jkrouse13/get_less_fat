class MonthlyGoalLog < ApplicationRecord
  belongs_to :monthly_goal

  validates :logged_date, presence: true
  validates :value, numericality: { greater_than: 0 }
end