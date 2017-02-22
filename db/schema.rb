# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160813234930) do

  create_table "alphabets", force: true do |t|
    t.integer  "machine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alphabets", ["machine_id"], name: "index_alphabets_on_machine_id"

  create_table "chars", force: true do |t|
    t.integer  "alphabet_id"
    t.string   "char"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chars", ["alphabet_id"], name: "index_chars_on_alphabet_id"

  create_table "machines", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.integer  "machine_id"
    t.string   "name"
    t.boolean  "starts"
    t.boolean  "accepts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["machine_id"], name: "index_states_on_machine_id"

  create_table "transitions", force: true do |t|
    t.string   "in_char"
    t.string   "out_char"
    t.string   "direction"
    t.integer  "machine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "in_state_id"
    t.integer  "out_state_id"
  end

  add_index "transitions", ["in_state_id"], name: "index_transitions_on_in_state_id"
  add_index "transitions", ["machine_id"], name: "index_transitions_on_machine_id"
  add_index "transitions", ["out_state_id"], name: "index_transitions_on_out_state_id"

end
