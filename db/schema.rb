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

ActiveRecord::Schema.define(version: 20141229103859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: true do |t|
    t.string  "name"
    t.boolean "isactive"
  end

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

  create_table "countries", force: true do |t|
    t.string  "name"
    t.boolean "isactive"
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
    t.string   "title"
    t.string   "first_name"
    t.string   "other_names"
    t.string   "last_name"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "address1"
    t.string   "address2"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "postcode"
    t.datetime "dateadded"
    t.datetime "dateupdated"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
    t.integer  "employee_id"
  end

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "other_names"
    t.string   "dob"
    t.integer  "gender_id"
    t.string   "emp_id"
    t.integer  "department_id"
    t.integer  "job_title_id"
    t.integer  "type_id"
    t.string   "ssn"
    t.integer  "marital_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "city_id"
    t.integer  "state_id"
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
    t.integer  "user_group_id"
    t.integer  "numlogins"
    t.integer  "user_id"
    t.integer  "user_ip"
    t.integer  "manager_id"
    t.integer  "delegated_id"
    t.boolean  "isactive"
    t.integer  "salaryband_id"
    t.float    "basesalary"
    t.integer  "nationality_id"
    t.datetime "start_date"
    t.integer  "race_id"
    t.string   "employee_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

  create_table "end_of_years", force: true do |t|
    t.string  "current_year"
    t.boolean "isactive"
  end

  create_table "genders", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isactive"
    t.integer  "company_id"
  end

  create_table "holidays", force: true do |t|
    t.string   "name"
    t.boolean  "isactive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "hol_date"
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

  create_table "leave_records", force: true do |t|
    t.integer  "leave_type_id"
    t.string   "rec_year"
    t.integer  "employee_id"
    t.integer  "carried_over"
    t.boolean  "archive"
    t.boolean  "isactive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "days_left"
    t.float    "days_taken"
  end

  create_table "leave_requests", force: true do |t|
    t.integer  "employee_id"
    t.boolean  "isactive"
    t.integer  "leave_year"
    t.datetime "date_from"
    t.datetime "date_to"
    t.float    "days_taken"
    t.float    "days_left"
    t.integer  "approver"
    t.string   "day_type"
    t.integer  "leave_type_id"
    t.datetime "date_booked"
    t.datetime "date_approved"
    t.text     "hand_over_notes"
    t.integer  "leave_statuses_id"
    t.string   "evidence"
    t.string   "relievers",         default: [], array: true
    t.string   "num_of_days"
  end

  create_table "leave_statuses", force: true do |t|
    t.string   "name"
    t.boolean  "isactive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leave_types", force: true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.integer  "emp_type"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gender_id"
    t.string   "option"
    t.integer  "entitlement"
    t.integer  "max_days"
    t.boolean  "carry_forward"
    t.string   "bookable_by"
    t.integer  "service_period_limitation"
    t.boolean  "weekend",                   default: false
    t.float    "days_per_month",            default: 0.0
  end

  create_table "maritals", force: true do |t|
    t.string  "name"
    t.boolean "isactive"
  end

  create_table "nationalities", force: true do |t|
    t.string  "name"
    t.boolean "isactive"
  end

  create_table "next_of_kins", force: true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "other_names"
    t.string   "last_name"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "address1"
    t.string   "address2"
    t.integer  "city_id"
    t.string   "postcode"
    t.integer  "relationship"
    t.float    "percentage"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.integer  "employee_id"
  end

  create_table "races", force: true do |t|
    t.string  "name"
    t.boolean "isactive"
  end

  create_table "salary_bands", force: true do |t|
    t.decimal "min_salary",  precision: 10, scale: 4
    t.decimal "max_salary",  precision: 10, scale: 0
    t.string  "band_name"
    t.string  "band_symbol"
  end

  create_table "states", force: true do |t|
    t.string  "name"
    t.boolean "isactive"
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

  create_table "types", force: true do |t|
    t.string  "name"
    t.boolean "isactive"
  end

  create_table "user_groups", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "role"
    t.integer  "user_id"
    t.string   "user_ip"
    t.boolean  "isactive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
