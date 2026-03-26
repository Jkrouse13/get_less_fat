class CreateMonthlyGoalLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :monthly_goal_logs do |t|
      t.references :monthly_goal, null: false, foreign_key: true
      t.date :logged_date
      t.decimal :value

      t.timestamps
    end
  end
end
