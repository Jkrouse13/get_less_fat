class MonthlyGoalTemplate < ApplicationRecord
  has_many :monthly_goals, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :unit, presence: true

  scope :by_category, -> { order(:category, :name) }
end