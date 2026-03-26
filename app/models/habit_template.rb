class HabitTemplate < ApplicationRecord
  has_many :weekly_habits, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true

  scope :by_category, -> { order(:category, :name) }
end