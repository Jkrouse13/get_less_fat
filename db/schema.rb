# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_03_25_231521) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "daily_tasks", force: :cascade do |t|
    t.date "assigned_date"
    t.integer "assigned_value"
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.bigint "exercise_id", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_daily_tasks_on_exercise_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "exercise_type", default: 0
    t.integer "max_value"
    t.integer "min_value"
    t.string "name"
    t.integer "step_value", default: 5
    t.string "unit"
    t.datetime "updated_at", null: false
  end

  create_table "habit_templates", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "monthly_goal_logs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "logged_date"
    t.bigint "monthly_goal_id", null: false
    t.datetime "updated_at", null: false
    t.decimal "value"
    t.index ["monthly_goal_id"], name: "index_monthly_goal_logs_on_monthly_goal_id"
  end

  create_table "monthly_goal_templates", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "unit"
    t.datetime "updated_at", null: false
  end

  create_table "monthly_goals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "current_value", default: "0.0"
    t.date "month_start"
    t.bigint "monthly_goal_template_id", null: false
    t.decimal "target_value"
    t.datetime "updated_at", null: false
    t.index ["monthly_goal_template_id"], name: "index_monthly_goals_on_monthly_goal_template_id"
  end

  create_table "user_preferences", force: :cascade do |t|
    t.json "active_days"
    t.datetime "created_at", null: false
    t.date "last"
    t.integer "tasks_per_day", default: 3
    t.datetime "updated_at", null: false
  end

  create_table "weekly_habit_logs", force: :cascade do |t|
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.date "logged_date"
    t.datetime "updated_at", null: false
    t.bigint "weekly_habit_id", null: false
    t.index ["weekly_habit_id"], name: "index_weekly_habit_logs_on_weekly_habit_id"
  end

  create_table "weekly_habits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "habit_template_id", null: false
    t.integer "target_days", default: 3
    t.datetime "updated_at", null: false
    t.date "week_start"
    t.index ["habit_template_id"], name: "index_weekly_habits_on_habit_template_id"
  end

  add_foreign_key "daily_tasks", "exercises"
  add_foreign_key "monthly_goal_logs", "monthly_goals"
  add_foreign_key "monthly_goals", "monthly_goal_templates"
  add_foreign_key "weekly_habit_logs", "weekly_habits"
  add_foreign_key "weekly_habits", "habit_templates"
end
