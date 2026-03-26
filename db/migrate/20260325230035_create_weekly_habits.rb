class CreateWeeklyHabits < ActiveRecord::Migration[8.1]
  def change
    create_table :weekly_habits do |t|
      t.references :habit_template, null: false, foreign_key: true
      t.integer :target_days, default: 3
      t.date :week_start

      t.timestamps
    end
  end
end
