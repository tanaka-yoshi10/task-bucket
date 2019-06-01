# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_01_161021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", default: "", null: false
    t.boolean "archive", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.text "description", default: "", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "routines", force: :cascade do |t|
    t.string "recurrence"
    t.string "title"
    t.integer "estimate"
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_routines_on_project_id"
    t.index ["user_id"], name: "index_routines_on_user_id"
  end

  create_table "shortcuts", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "project_id"
    t.integer "position", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_shortcuts_on_project_id"
    t.index ["user_id"], name: "index_shortcuts_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.date "scheduled_on", null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "estimate"
    t.bigint "project_id"
    t.string "title", default: ""
    t.text "comment", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "routine_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["routine_id"], name: "index_tasks_on_routine_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "projects", "users"
  add_foreign_key "routines", "projects"
  add_foreign_key "routines", "users"
  add_foreign_key "shortcuts", "projects"
  add_foreign_key "shortcuts", "users"
  add_foreign_key "tasks", "routines"
  add_foreign_key "tasks", "users"
end
