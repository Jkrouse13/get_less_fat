class WeeklyHabit < ApplicationRecord
  belongs_to :habit_template
  has_many :weekly_habit_logs, dependent: :destroy

  validates :target_days, numericality: { greater_than: 0, less_than_or_equal_to: 7 }
  validates :week_start, presence: true

  def days_completed
    weekly_habit_logs.where(completed: true).count
  end

  def progress
    "#{days_completed}/#{target_days}"
  end

  def met?
    days_completed >= target_days
  end

  def log_today!(completed: true)
    weekly_habit_logs.find_or_create_by!(logged_date: Date.current) do |log|
      log.completed = completed
    end
  end
end