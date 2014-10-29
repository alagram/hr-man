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

ActiveRecord::Schema.define(version: 20141029143158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "other_names"
    t.string   "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gender_id"
  end

  create_table "genders", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isactive"
    t.integer  "company_id"
  end

  create_table "leave_requests", force: true do |t|
    t.integer  "emp_id"
    t.string   "balance_year"
    t.string   "taken"
    t.string   "left"
    t.string   "approver"
    t.text     "handovernotes"
    t.string   "reliever1"
    t.string   "reliever2"
    t.integer  "leavetype"
    t.string   "daytype"
    t.datetime "datefrom"
    t.datetime "dateto"
    t.datetime "datebooked"
    t.datetime "dateapproved"
    t.boolean  "status"
    t.boolean  "isactive"
  end

  create_table "leave_types", force: true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.float    "dayspermonth"
    t.integer  "emptype"
    t.datetime "dateadded"
    t.datetime "dateupdated"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
  end

end
