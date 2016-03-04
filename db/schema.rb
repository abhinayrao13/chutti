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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160304063357) do
=======
ActiveRecord::Schema.define(version: 20160302094432) do

  create_table "checkins", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "date"
    t.datetime "check_in"
    t.datetime "check_out"
  end
>>>>>>> 1311a6f2a45f53299500911bf5b0ea778db869e7

  create_table "leaves", force: :cascade do |t|
    t.string  "reason_for_leave"
    t.integer "user_id"
    t.string  "status"
    t.date    "leave_date_from"
    t.date    "leave_date_to"
  end

  create_table "notices", force: :cascade do |t|
    t.string  "subject"
    t.string  "content"
    t.integer "user_id"
    t.date    "posted_on"
  end

  create_table "roles", force: :cascade do |t|
    t.string "user_role"
  end

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
    t.string   "gender"
    t.string   "phone_no"
    t.integer  "role_id"
    t.integer  "max_leaves"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
