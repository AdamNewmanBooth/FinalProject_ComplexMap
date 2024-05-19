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

ActiveRecord::Schema[7.0].define(version: 2024_05_19_195204) do
  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "election_subcircuits", force: :cascade do |t|
    t.integer "election_id"
    t.integer "subcircuit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elections", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcircuits", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.integer "election_subcircuit_id"
    t.integer "vacating_candidate_id"
    t.string "name"
    t.integer "suburban_vote"
    t.integer "chicago_vote"
    t.integer "total_vote"
    t.integer "winning_candidate_id"
    t.integer "losing_candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacancy_candidates", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "vacancy_id"
    t.integer "party_id"
    t.integer "suburban_vote"
    t.integer "chicago_vote"
    t.string "total_vote"
    t.float "suburban_percentage"
    t.float "chicago_percentage"
    t.float "total_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
