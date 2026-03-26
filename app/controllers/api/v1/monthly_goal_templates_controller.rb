class Api::V1::MonthlyGoalTemplatesController < ApplicationController
  def index
    render json: MonthlyGoalTemplate.by_category
  end
end