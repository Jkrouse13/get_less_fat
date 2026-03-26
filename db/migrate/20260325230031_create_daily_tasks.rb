class CreateDailyTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :daily_tasks do |t|
      t.references :exercise, null: false, foreign_key: true
      t.date :assigned_date
      t.integer :assigned_value
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
