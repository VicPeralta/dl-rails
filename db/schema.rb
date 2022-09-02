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

ActiveRecord::Schema[7.0].define(version: 2022_09_01_153721) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", id: :string, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer "q1"
    t.integer "q2"
    t.integer "q3"
    t.integer "q4"
    t.string "rq1"
    t.string "rq2"
    t.string "rq3"
    t.string "rq4"
    t.string "rf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "student_id"
    t.string "course_id"
    t.index ["course_id"], name: "index_grades_on_course_id"
    t.index ["student_id", "course_id"], name: "index_grades_on_student_id_and_course_id", unique: true
    t.index ["student_id"], name: "index_grades_on_student_id"
  end

  create_table "students", id: :string, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "grades", "courses"
  add_foreign_key "grades", "students"
end
