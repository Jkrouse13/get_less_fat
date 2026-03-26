class Api::V1::ExercisesController < ApplicationController
  def index
    render json: Exercise.order(:name)
  end
end