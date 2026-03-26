# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
exercises = [
  { name: "Pushups", exercise_type: :reps, min_value: 5, max_value: 50, step_value: 5, unit: "reps" },
  { name: "Situps", exercise_type: :reps, min_value: 10, max_value: 50, step_value: 5, unit: "reps" },
  { name: "Bench Dips", exercise_type: :reps, min_value: 5, max_value: 40, step_value: 5, unit: "reps" },
  { name: "Pull Ups", exercise_type: :reps, min_value: 5, max_value: 25, step_value: 5, unit: "reps" },
  { name: "Squats", exercise_type: :reps, min_value: 10, max_value: 50, step_value: 5, unit: "reps" },
  { name: "Lunges", exercise_type: :reps, min_value: 10, max_value: 40, step_value: 5, unit: "reps" },
  { name: "Calf Raises", exercise_type: :reps, min_value: 10, max_value: 50, step_value: 5, unit: "reps" },
  { name: "Flutter Kicks", exercise_type: :reps, min_value: 10, max_value: 50, step_value: 5, unit: "reps" },
  { name: "Leg Raises", exercise_type: :reps, min_value: 5, max_value: 30, step_value: 5, unit: "reps" },
  { name: "Glute Bridges", exercise_type: :reps, min_value: 10, max_value: 50, step_value: 5, unit: "reps" },
  { name: "Planks", exercise_type: :timed, min_value: 15, max_value: 120, step_value: 15, unit: "seconds" },
  { name: "Wall Sits", exercise_type: :timed, min_value: 15, max_value: 90, step_value: 15, unit: "seconds" },
  { name: "Superman Holds", exercise_type: :timed, min_value: 15, max_value: 60, step_value: 15, unit: "seconds" },
  { name: "Walks", exercise_type: :timed, min_value: 10, max_value: 45, step_value: 5, unit: "minutes" },
]

exercises.each do |attrs|
  Exercise.find_or_create_by!(name: attrs[:name]) do |e|
    e.assign_attributes(attrs)
  end
end

puts "Seeded #{Exercise.count} exercises"

habit_templates = [
  { name: "Eat a healthy meal", category: "Nutrition" },
  { name: "No fast food", category: "Nutrition" },
  { name: "No sugary drinks", category: "Nutrition" },
  { name: "Eat vegetables", category: "Nutrition" },
  { name: "Cook at home", category: "Nutrition" },
  { name: "No late-night snacking", category: "Nutrition" },
  { name: "Drink 8 glasses of water", category: "Hydration" },
  { name: "No alcohol", category: "Hydration" },
  { name: "No soda", category: "Hydration" },
  { name: "Get 7+ hours of sleep", category: "Sleep" },
  { name: "No screens before bed", category: "Sleep" },
  { name: "In bed by 11pm", category: "Sleep" },
  { name: "Stretch for 10 minutes", category: "Activity" },
  { name: "Take the stairs", category: "Activity" },
  { name: "Stand up every hour", category: "Activity" },
  { name: "Meditate", category: "Mindfulness" },
  { name: "Journal", category: "Mindfulness" },
  { name: "No social media binge", category: "Mindfulness" },
]

habit_templates.each do |attrs|
  HabitTemplate.find_or_create_by!(name: attrs[:name]) do |ht|
    ht.assign_attributes(attrs)
  end
end

puts "Seeded #{HabitTemplate.count} habit templates"

monthly_goal_templates = [
  { name: "Lose weight", unit: "pounds", category: "Fitness" },
  { name: "Run total miles", unit: "miles", category: "Fitness" },
  { name: "Total pushups", unit: "reps", category: "Fitness" },
  { name: "Total walk time", unit: "minutes", category: "Fitness" },
  { name: "Cook at home", unit: "times", category: "Nutrition" },
  { name: "No fast food days", unit: "days", category: "Nutrition" },
  { name: "Meal prep", unit: "times", category: "Nutrition" },
  { name: "Meditate", unit: "times", category: "Wellness" },
  { name: "Read books", unit: "books", category: "Wellness" },
  { name: "Get 7+ hours sleep", unit: "nights", category: "Wellness" },
  { name: "Journal", unit: "times", category: "Wellness" },
  { name: "Total miles walked", unit: "miles", category: "Activity" },
  { name: "Complete workouts", unit: "workouts", category: "Activity" },
]

monthly_goal_templates.each do |attrs|
  MonthlyGoalTemplate.find_or_create_by!(name: attrs[:name]) do |mgt|
    mgt.assign_attributes(attrs)
  end
end

puts "Seeded #{MonthlyGoalTemplate.count} monthly goal templates"