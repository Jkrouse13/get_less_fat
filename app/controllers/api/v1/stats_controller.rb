class Api::V1::StatsController < ApplicationController
  def lifetime
    render json: {
      exercises: exercise_stats,
      habits: habit_stats,
      monthly_goals: monthly_goal_stats
    }
  end

  private

  def exercise_stats
    DailyTask.joins(:exercise)
             .where(completed: true)
             .group("exercises.name", "exercises.unit")
             .sum(:assigned_value)
             .map { |(name, unit), total| { name: name, total: total, unit: unit } }
  end

  def habit_stats
    WeeklyHabitLog.joins(weekly_habit: :habit_template)
                  .where(completed: true)
                  .group("habit_templates.name")
                  .count
                  .map { |name, count| { name: name, total_days: count } }
  end

  def monthly_goal_stats
    MonthlyGoalLog.joins(monthly_goal: :monthly_goal_template)
                  .group("monthly_goal_templates.name", "monthly_goal_templates.unit")
                  .sum(:value)
                  .map { |(name, unit), total| { name: name, total: total, unit: unit } }
  end
end