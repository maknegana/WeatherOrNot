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

ActiveRecord::Schema.define(version: 20161129022146) do

  create_table "day_weathers", force: :cascade do |t|
    t.integer  "date"
    t.integer  "temp"
    t.string   "sky"
    t.integer  "precipitation"
    t.integer  "wind"
    t.integer  "humidity"
    t.string   "location"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "feedback_forms", force: :cascade do |t|
    t.integer  "feel"
    t.integer  "top"
    t.integer  "bottom"
    t.integer  "shoes"
    t.integer  "hands"
    t.integer  "head"
    t.integer  "eyes"
    t.integer  "ears"
    t.integer  "neck"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "day_weather_id"
    t.integer  "what_to_bring_id"
    t.integer  "user_id"
  end

  add_index "feedback_forms", ["day_weather_id"], name: "index_feedback_forms_on_day_weather_id"
  add_index "feedback_forms", ["user_id"], name: "index_feedback_forms_on_user_id"
  add_index "feedback_forms", ["what_to_bring_id"], name: "index_feedback_forms_on_what_to_bring_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "what_to_brings", force: :cascade do |t|
    t.string   "weather"
    t.integer  "top"
    t.integer  "bottom"
    t.integer  "shoes"
    t.integer  "hands"
    t.integer  "head"
    t.integer  "eyes"
    t.integer  "ears"
    t.integer  "neck"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "bring"
  end

  add_index "what_to_brings", ["user_id"], name: "index_what_to_brings_on_user_id"

end
