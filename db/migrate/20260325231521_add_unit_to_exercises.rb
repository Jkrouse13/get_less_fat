class AddUnitToExercises < ActiveRecord::Migration[8.1]
  def change
    add_column :exercises, :unit, :string
  end
end
