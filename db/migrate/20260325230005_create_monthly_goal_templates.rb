class CreateMonthlyGoalTemplates < ActiveRecord::Migration[8.1]
  def change
    create_table :monthly_goal_templates do |t|
      t.string :name
      t.string :unit
      t.string :category

      t.timestamps
    end
  end
end
