class Api::V1::WeeklyHabitsController < ApplicationController
  def index
    week_start = (params[:week_start].present? ? Date.parse(params[:week_start]) : Date.current.beginning_of_week(:monday))
    habits = WeeklyHabit.includes(:habit_template, :weekly_habit_logs).where(week_start: week_start)

    render json: habits.map { |h| habit_json(h) }
  end

  def create
    habit = WeeklyHabit.new(weekly_habit_params)
    habit.week_start ||= Date.current.beginning_of_week(:monday)

    if habit.save
      render json: habit_json(habit), status: :created
    else
      render json: { errors: habit.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    habit = WeeklyHabit.find(params[:id])
    if habit.update(weekly_habit_params)
      render json: habit_json(habit)
    else
      render json: { errors: habit.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    WeeklyHabit.find(params[:id]).destroy
    head :no_content
  end

  def log_today
    habit = WeeklyHabit.find(params[:id])
    log = habit.log_today!
    render json: habit_json(habit)
  end

  private

  def weekly_habit_params
    params.require(:weekly_habit).permit(:habit_template_id, :target_days, :week_start)
  end

  def habit_json(habit)
    habit.as_json(include: :habit_template).merge(
      days_completed: habit.days_completed,
      progress: habit.progress,
      met: habit.met?
    )
  end
end