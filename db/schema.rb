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

ActiveRecord::Schema[7.1].define(version: 2024_05_11_162612) do
  create_table "applications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.datetime "applied_at", null: false
    t.boolean "cv", default: false, null: false
    t.text "cover_letter"
    t.text "notes"
    t.integer "preference", limit: 1, null: false, unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_applications_on_job_id"
    t.check_constraint "`preference` between 1 and 100", name: "applications_preference_range"
  end

  create_table "jobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "company", null: false
    t.string "url", null: false
    t.string "title", null: false
    t.text "description"
    t.string "product", null: false
    t.string "based_in", null: false
    t.string "timezones"
    t.text "stack", null: false
    t.text "compensation", null: false
    t.text "pto"
    t.string "glassdoor_url"
    t.integer "glassdoor_rating", limit: 1, unsigned: true
    t.text "notes"
    t.integer "preference", limit: 1, null: false, unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "`glassdoor_rating` between 1 and 50", name: "jobs_glassdoor_rating_range"
    t.check_constraint "`preference` between 1 and 100", name: "jobs_preference_range"
  end

  create_table "replies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "application_id", null: false
    t.datetime "received_at", null: false
    t.text "body", null: false
    t.integer "preference", limit: 1, null: false, unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_replies_on_application_id"
    t.check_constraint "`preference` between 1 and 100", name: "replies_preference_range"
  end

  add_foreign_key "applications", "jobs"
  add_foreign_key "replies", "applications"
end