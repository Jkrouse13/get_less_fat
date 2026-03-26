class CreateExercises < ActiveRecord::Migration[8.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :exercise_type, default: 0
      t.integer :min_value
      t.integer :max_value
      t.integer :step_value, default: 5

      t.timestamps
    end
  end
end
