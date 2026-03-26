class CreateMonthlyGoals < ActiveRecord::Migration[8.1]
  def change
    create_table :monthly_goals do |t|
      t.references :monthly_goal_template, null: false, foreign_key: true
      t.decimal :target_value
      t.decimal :current_value, default: 0.0
      t.date :month_start

      t.timestamps
    end
  end
end
