class CreateWeeklyHabitLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :weekly_habit_logs do |t|
      t.references :weekly_habit, null: false, foreign_key: true
      t.date :logged_date
      t.boolean :completed

      t.timestamps
    end
  end
end
