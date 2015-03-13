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

ActiveRecord::Schema.define(version: 20150313084849) do

  create_table "comments", force: true do |t|
    t.integer "user_id"
    t.integer "note_id"
    t.text    "text"
  end

  add_index "comments", ["note_id"], name: "index_comments_on_note_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "notes", force: true do |t|
    t.integer  "user_id"
    t.integer  "student_id"
    t.text     "text"
    t.integer  "category",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resolution",     default: 0
    t.integer  "importance",     default: 0
    t.integer  "mood",           default: 0
    t.integer  "privacy_status", default: 0
    t.string   "location"
  end

  add_index "notes", ["student_id"], name: "index_notes_on_student_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "students", force: true do |t|
    t.string   "given_name"
    t.string   "surname"
    t.string   "image"
    t.integer  "age"
    t.date     "joined_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students_users", id: false, force: true do |t|
    t.integer "student_id"
    t.integer "user_id"
  end

  add_index "students_users", ["student_id"], name: "index_students_users_on_student_id"
  add_index "students_users", ["user_id"], name: "index_students_users_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "views", force: true do |t|
    t.integer  "user_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "views", ["student_id"], name: "index_views_on_student_id"
  add_index "views", ["user_id"], name: "index_views_on_user_id"

end
