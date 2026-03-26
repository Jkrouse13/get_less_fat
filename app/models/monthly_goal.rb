class MonthlyGoal < ApplicationRecord
  belongs_to :monthly_goal_template
  has_many :monthly_goal_logs, dependent: :destroy

  validates :target_value, numericality: { greater_than: 0 }
  validates :month_start, presence: true

  def progress_percentage
    return 0 if target_value.zero?
    [(current_value / target_value * 100).round, 100].min
  end

  def met?
    current_value >= target_value
  end

  def log_entry!(value)
    monthly_goal_logs.create!(logged_date: Date.current, value: value)
    increment!(:current_value, value)
  end
end