class Api::V1::MonthlyGoalsController < ApplicationController
  def index
    month_start = (params[:month_start].present? ? Date.parse(params[:month_start]) : Date.current.beginning_of_month)
    goals = MonthlyGoal.includes(:monthly_goal_template, :monthly_goal_logs).where(month_start: month_start)

    render json: goals.map { |g| goal_json(g) }
  end

  def create
    goal = MonthlyGoal.new(monthly_goal_params)
    goal.month_start ||= Date.current.beginning_of_month

    if goal.save
      render json: goal_json(goal), status: :created
    else
      render json: { errors: goal.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    goal = MonthlyGoal.find(params[:id])
    if goal.update(monthly_goal_params)
      render json: goal_json(goal)
    else
      render json: { errors: goal.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    MonthlyGoal.find(params[:id]).destroy
    head :no_content
  end

  def log_entry
    goal = MonthlyGoal.find(params[:id])
    goal.log_entry!(params[:value].to_f)
    render json: goal_json(goal)
  end

  private

  def monthly_goal_params
    params.require(:monthly_goal).permit(:monthly_goal_template_id, :target_value, :month_start)
  end

  def goal_json(goal)
    goal.as_json(include: :monthly_goal_template).merge(
      progress_percentage: goal.progress_percentage,
      met: goal.met?
    )
  end
end