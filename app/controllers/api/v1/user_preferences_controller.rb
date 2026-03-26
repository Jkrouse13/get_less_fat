class Api::V1::UserPreferencesController < ApplicationController
  def show
    render json: UserPreference.current
  end

  def update
    pref = UserPreference.current
    if pref.update(pref_params)
      render json: pref
    else
      render json: { errors: pref.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def pref_params
    params.require(:user_preference).permit(:tasks_per_day, active_days: [])
  end
end