class Api::V1::DailyTasksController < ApplicationController
  def index
    date = params[:date].present? ? Date.parse(params[:date]) : Date.current
    tasks = DailyTask.includes(:exercise).for_date(date)
    render json: tasks, include: :exercise
  end

  def generate
    date = params[:date].present? ? Date.parse(params[:date]) : Date.current
    tasks = DailyTask.generate_for_date!(date)
    render json: tasks, include: :exercise
  end

  def complete
    task = DailyTask.find(params[:id])
    task.complete!
    render json: task, include: :exercise
  end

  def stats
    date = params[:date].present? ? Date.parse(params[:date]) : Date.current
    tasks = DailyTask.for_date(date)

    render json: {
      total: tasks.count,
      completed: tasks.completed.count,
      incomplete: tasks.incomplete.count
    }
  end
end