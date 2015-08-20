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

ActiveRecord::Schema.define(version: 20150820061946) do

  create_table "application_items", force: :cascade do |t|
    t.integer  "application_id",         limit: 4
    t.integer  "application_product_id", limit: 4
    t.string   "unit_of_measure",        limit: 255
    t.float    "quantity",               limit: 24
    t.float    "h2o_quantity_liters",    limit: 24
    t.float    "total_product_used",     limit: 24
    t.float    "cost_per_unit",          limit: 24
    t.float    "total_cost",             limit: 24
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "application_processes", force: :cascade do |t|
    t.integer  "application_ids", limit: 4
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "application_products", force: :cascade do |t|
    t.integer  "application_item_ids", limit: 4
    t.string   "name",                 limit: 255
    t.text     "description",          limit: 65535
    t.float    "quantity_available",   limit: 24
    t.string   "units_of_measure",     limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "applications", force: :cascade do |t|
    t.date     "application_date"
    t.integer  "application_process_id", limit: 4
    t.text     "purpose",                limit: 65535
    t.integer  "greenhouse_id",          limit: 4
    t.integer  "application_item_ids",   limit: 4
    t.float    "application_cost",       limit: 24
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "assistances", force: :cascade do |t|
    t.integer  "employee_id",      limit: 4
    t.date     "assistance_date"
    t.boolean  "assisted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pay_roll_item_id", limit: 4
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name",              limit: 255
    t.string   "second_name",             limit: 255
    t.string   "last_name",               limit: 255
    t.string   "second_last_name",        limit: 255
    t.float    "salary",                  limit: 24
    t.integer  "greenhouse_employee_ids", limit: 4
    t.integer  "job_position_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pay_roll_item_ids",       limit: 4
  end

  create_table "greenhouse_employees", force: :cascade do |t|
    t.integer  "greenhouse_id", limit: 4
    t.integer  "employee_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "greenhouses", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.string   "description",             limit: 255
    t.string   "location",                limit: 255
    t.integer  "greenhouse_employee_ids", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_ids",         limit: 4
  end

  create_table "job_positions", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "description",  limit: 255
    t.integer  "employee_ids", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pay_roll_items", force: :cascade do |t|
    t.integer  "pay_roll_id",       limit: 4
    t.integer  "employee_id",       limit: 4
    t.integer  "total_assistances", limit: 4
    t.float    "salary",            limit: 24
    t.float    "discounts",         limit: 24
    t.float    "bonuses",           limit: 24
    t.float    "total",             limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assistance_ids",    limit: 4
  end

  create_table "pay_rolls", force: :cascade do |t|
    t.integer  "pay_roll_item_ids", limit: 4
    t.date     "start_date"
    t.date     "end_date"
    t.float    "subtotal",          limit: 24
    t.float    "discount",          limit: 24
    t.float    "bonus",             limit: 24
    t.float    "total",             limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
