class CreateHabitTemplates < ActiveRecord::Migration[8.1]
  def change
    create_table :habit_templates do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
