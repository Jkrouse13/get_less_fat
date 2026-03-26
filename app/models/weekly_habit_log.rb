class WeeklyHabitLog < ApplicationRecord
  belongs_to :weekly_habit

  validates :logged_date, presence: true
  validates :logged_date, uniqueness: { scope: :weekly_habit_id }

  after_create :update_monthly_goals!

  private

  MONTHLY_GOAL_MAPPINGS = {
    "Cook at home" => "Cook at home",
    "No fast food" => "No fast food days",
    "Meditate" => "Meditate",
    "Journal" => "Journal",
    "Get 7+ hours of sleep" => "Get 7+ hours sleep",
  }.freeze

  def update_monthly_goals!
    return unless completed?

    habit_name = weekly_habit.habit_template.name
    goal_template_name = MONTHLY_GOAL_MAPPINGS[habit_name]
    return unless goal_template_name

    month_start = Date.current.beginning_of_month
    template = MonthlyGoalTemplate.find_by(name: goal_template_name)
    return unless template

    goal = MonthlyGoal.find_by(monthly_goal_template: template, month_start: month_start)
    goal&.log_entry!(1)
  end
end