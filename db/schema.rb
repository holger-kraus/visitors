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

ActiveRecord::Schema[7.0].define(version: 2022_10_17_171431) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "population"
  end

  create_table "days", force: :cascade do |t|
    t.string "name"
    t.bigint "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "tstamp", precision: nil
    t.index ["week_id"], name: "index_days_on_week_id"
  end

  create_table "table_name", id: false, force: :cascade do |t|
  end

  create_table "test", id: false, force: :cascade do |t|
  end

  create_table "timeslots", force: :cascade do |t|
    t.string "name"
    t.bigint "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "booker"
    t.index ["day_id"], name: "index_timeslots_on_day_id"
  end

  create_table "weeks", force: :cascade do |t|
    t.string "name"
    t.integer "next"
    t.integer "previous"
    t.datetime "firstday", precision: nil
    t.datetime "lastday", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
