class Exercise < ApplicationRecord
  enum :exercise_type, { reps: 0, timed: 1 }

  validates :name, presence: true, uniqueness: true
  validates :min_value, :max_value, presence: true
  validates :max_value, numericality: { greater_than: :min_value }
  validates :unit, presence: true

  MONTHLY_GOAL_MAPPINGS = {
    "Pushups" => "Total pushups",
    "Walks" => "Total walk time",
  }.freeze

  def random_value
    values = (min_value..max_value).step(step_value).to_a
    values.sample
  end

  def display_value(value)
    case unit
    when "reps" then "#{value} reps"
    when "seconds" then "#{value} seconds"
    when "minutes" then "#{value} minutes"
    end
  end

  def matching_monthly_goal_template_name
    MONTHLY_GOAL_MAPPINGS[name]
  end
end