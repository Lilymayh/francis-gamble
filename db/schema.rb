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

ActiveRecord::Schema.define(version: 2024_05_21_194239) do

# Could not dump table "bets" because of following StandardError
#   Unknown type 'uuid' for column 'id'

  create_table "fake_users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
  end

# Could not dump table "games" because of following StandardError
#   Unknown type 'uuid' for column 'id'

  create_table "tictactoes", force: :cascade do |t|
    t.text "board", default: "[]"
    t.string "current_turn", default: "X"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

# Could not dump table "winnings" because of following StandardError
#   Unknown type 'uuid' for column 'id'

  add_foreign_key "bets", "games"
  add_foreign_key "bets", "users"
  add_foreign_key "winnings", "bets"
end
