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

ActiveRecord::Schema.define(version: 20180104194600) do

  create_table "appointments", force: :cascade do |t|
    t.string  "purpose"
    t.string  "extra"
    t.integer "employee_id",      default: 0
    t.integer "customer_id",      default: 0
    t.boolean "confirmation",     default: false
    t.integer "user_id"
    t.date    "appointment_date"
    t.string  "appointment_time"
  end

  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id"

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone_number"
    t.string   "city"
    t.string   "pesel"
    t.integer  "user_id"
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id"

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.string   "telephone_number"
    t.integer  "user_id"
  end

  add_index "employees", ["user_id"], name: "index_employees_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "secretaries", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone_number"
    t.integer  "user_id"
  end

  add_index "secretaries", ["user_id"], name: "index_secretaries_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "type",                   default: "customer"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "working_hours", force: :cascade do |t|
    t.integer  "lp"
    t.string   "day"
    t.string   "start_hour"
    t.string   "end_hour"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
  end

  add_index "working_hours", ["employee_id"], name: "index_working_hours_on_employee_id"

end
