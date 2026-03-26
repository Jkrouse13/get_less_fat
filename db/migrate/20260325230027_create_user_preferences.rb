class CreateUserPreferences < ActiveRecord::Migration[8.1]
  def change
    create_table :user_preferences do |t|
      t.integer :tasks_per_day, default: 3
      t.date :last
      t.json :active_days

      t.timestamps
    end
  end
end
