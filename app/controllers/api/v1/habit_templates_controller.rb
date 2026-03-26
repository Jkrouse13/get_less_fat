class Api::V1::HabitTemplatesController < ApplicationController
  def index
    render json: HabitTemplate.by_category
  end
end