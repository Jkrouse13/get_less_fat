class DailyTask < ApplicationRecord
  belongs_to :exercise

  validates :assigned_date, presence: true
  validates :assigned_value, presence: true

  scope :for_date, ->(date) { where(assigned_date: date) }
  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }

  def complete!
    update!(completed: true)
    update_monthly_goals!
  end

  def self.generate_for_date!(date)
    return where(assigned_date: date) if where(assigned_date: date).exists?

    pref = UserPreference.current
    return [] unless pref.active_on?(date.wday)

    exercises = Exercise.order("RANDOM()").limit(pref.tasks_per_day)
    exercises.map do |exercise|
      create!(
        exercise: exercise,
        assigned_date: date,
        assigned_value: exercise.random_value
      )
    end
  end

  private

  def update_monthly_goals!
    month_start = Date.current.beginning_of_month

    # Increment specific exercise goals
    template_name = exercise.matching_monthly_goal_template_name
    if template_name
      template = MonthlyGoalTemplate.find_by(name: template_name)
      if template
        goal = MonthlyGoal.find_by(monthly_goal_template: template, month_start: month_start)
        goal&.log_entry!(assigned_value)
      end
    end

    # Increment "Complete workouts" goal
    workouts_template = MonthlyGoalTemplate.find_by(name: "Complete workouts")
    if workouts_template
      goal = MonthlyGoal.find_by(monthly_goal_template: workouts_template, month_start: month_start)
      goal&.log_entry!(1)
    end
  end
end