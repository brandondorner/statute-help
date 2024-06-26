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

ActiveRecord::Schema[7.0].define(version: 2023_08_03_034535) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "condition_fields", force: :cascade do |t|
    t.string "input_name"
    t.string "input_type"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "statute_id", null: false
    t.json "options", default: []
    t.string "dependent_on"
    t.string "dependent_condition"
    t.index ["statute_id"], name: "index_condition_fields_on_statute_id"
  end

  create_table "statutes", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "sentences", default: []
    t.string "title"
  end

  add_foreign_key "condition_fields", "statutes"
end
