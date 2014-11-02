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

ActiveRecord::Schema.define(version: 20141101183846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "configurations", force: true do |t|
    t.integer  "company_id"
    t.string   "configure"
    t.string   "value"
    t.string   "datatype"
    t.datetime "dateadded"
    t.datetime "dateupdated"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
  end

  create_table "currencies", force: true do |t|
    t.string   "name",        limit: 35
    t.string   "symbol",      limit: 5
    t.string   "code",        limit: 5
    t.datetime "dateadded"
    t.datetime "dateupdated"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
  end

  create_table "departments", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.integer  "manager_id"
    t.datetime "dateadded"
    t.datetime "dateupdated"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
  end

  create_table "emergencies", force: true do |t|
    t.integer  "emp_id"
    t.string   "title"
    t.string   "first_name"
    t.string   "other_names"
    t.string   "last_name"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "address1"
    t.string   "address2"
    t.integer  "city"
    t.integer  "state"
    t.string   "postcode"
    t.datetime "dateadded"
    t.datetime "dateupdated"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
  end

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "other_names"
    t.string   "dob"
    t.integer  "gender_id"
    t.string   "emp_id"
    t.integer  "dept_id"
    t.integer  "job_id"
    t.integer  "type_id"
    t.string   "ssn"
    t.string   "race"
    t.integer  "marital"
    t.string   "nationality"
    t.string   "address1"
    t.string   "address2"
    t.string   "city_id"
    t.integer  "state"
    t.integer  "zipcode"
    t.integer  "country_id"
    t.string   "email"
    t.string   "webpage"
    t.string   "homephone"
    t.string   "officephone"
    t.string   "cellphone"
    t.float    "regularhours"
    t.string   "username"
    t.string   "password_digest"
    t.integer  "usergroup_id"
    t.integer  "numlogins"
    t.datetime "dateadded"
    t.datetime "dateupdated"
    t.integer  "user_id"
    t.integer  "user_ip"
    t.integer  "manager_id"
    t.integer  "delegated_id"
    t.boolean  "isactive"
    t.integer  "salaryband_id"
    t.float    "basesalary"
  end

  create_table "genders", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isactive"
    t.integer  "company_id"
  end

  create_table "job_titles", force: true do |t|
    t.integer  "emp_id"
    t.integer  "company_id"
    t.string   "name"
    t.text     "desc"
    t.text     "responsibilities"
    t.datetime "dateadded"
    t.datetime "dateupdated"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
  end

  create_table "job_vacancies", force: true do |t|
    t.integer  "company_id"
    t.integer  "job_title_id"
    t.integer  "division_id"
    t.integer  "department_id"
    t.integer  "location_id"
    t.integer  "currency_id"
    t.float    "salary"
    t.integer  "grade"
    t.float    "hours"
    t.integer  "contract_type"
    t.string   "reporting_to"
    t.text     "addtional_info"
    t.text     "company_profile"
    t.text     "job_summary"
    t.text     "responsibilities"
    t.text     "selection_criteria"
    t.text     "desirable"
    t.text     "how_to_apply"
    t.datetime "dateadded"
    t.datetime "dateupdated"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
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

  create_table "next_of_kins", force: true do |t|
    t.integer  "emp_id"
    t.string   "title"
    t.string   "first_name"
    t.string   "other_names"
    t.string   "last_name"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "address1"
    t.string   "address2"
    t.integer  "city"
    t.integer  "state"
    t.string   "postcode"
    t.integer  "relationship"
    t.float    "percentage"
    t.datetime "dateadded"
    t.datetime "dateupdated"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
  end

  create_table "salary_bands", force: true do |t|
    t.decimal "min_salary",  precision: 10, scale: 4
    t.decimal "max_salary",  precision: 10, scale: 0
    t.string  "band_name"
    t.string  "band_symbol"
  end

  create_table "teams", force: true do |t|
    t.integer  "company_id"
    t.integer  "dept_id"
    t.string   "name"
    t.integer  "manager_id"
    t.datetime "dateadded"
    t.datetime "dateupdated"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
  end

  create_table "tracings", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "user_ip"
    t.string   "action"
    t.integer  "record_id"
    t.datetime "event_date"
  end

  create_table "user_groups", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "role"
    t.datetime "dateadded"
    t.datetime "dateupdated"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
  end

end
