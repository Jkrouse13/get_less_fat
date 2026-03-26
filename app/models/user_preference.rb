class UserPreference < ApplicationRecord
  validates :tasks_per_day, numericality: { greater_than: 0, less_than_or_equal_to: 10 }

  def active_on?(day_number)
    return false if active_days.blank?
    active_days.include?(day_number)
  end

  def self.current
    first_or_create!(tasks_per_day: 3, active_days: [1, 2, 3, 4, 5])
  end
end