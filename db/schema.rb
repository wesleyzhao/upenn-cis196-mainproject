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

ActiveRecord::Schema.define(version: 20140303040159) do

  create_table "food_items", force: true do |t|
    t.string   "name"
    t.integer  "calories"
    t.integer  "protein"
    t.integer  "carbs"
    t.integer  "fat"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "food_items", ["user_id"], name: "index_food_items_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.float    "height_cm"
    t.float    "weight_kg"
    t.string   "activity_level"
    t.float    "body_fat_percent"
    t.float    "weight_kg_goal"
    t.float    "body_fat_percent_goal"
    t.integer  "zipcode"
    t.string   "address_street1"
    t.string   "address_street2"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
