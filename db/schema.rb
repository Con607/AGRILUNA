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

ActiveRecord::Schema.define(version: 20160609055100) do

  create_table "administration_costs", force: :cascade do |t|
    t.date     "event_date"
    t.string   "concept",                          limit: 255
    t.string   "display",                          limit: 255
    t.float    "unit_price",                       limit: 24
    t.integer  "quantity",                         limit: 4
    t.float    "total",                            limit: 24
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "company_id",                       limit: 4
    t.integer  "apportionment_per_greenhouse_ids", limit: 4
  end

  create_table "application_items", force: :cascade do |t|
    t.integer  "application_id",         limit: 4
    t.integer  "application_product_id", limit: 4
    t.float    "quantity",               limit: 24
    t.float    "h2o_quantity_liters",    limit: 24
    t.float    "total_product_used",     limit: 24
    t.float    "cost_per_unit",          limit: 24
    t.float    "total_cost",             limit: 24
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "unit_type_id",           limit: 4
  end

  create_table "application_processes", force: :cascade do |t|
    t.integer  "application_ids", limit: 4
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "application_products", force: :cascade do |t|
    t.integer  "application_item_ids",        limit: 4
    t.string   "name",                        limit: 255
    t.text     "description",                 limit: 65535
    t.float    "quantity_available",          limit: 24
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "application_product_buy_ids", limit: 4
    t.integer  "unit_type_id",                limit: 4
    t.float    "total_cost",                  limit: 24
    t.float    "unit_cost",                   limit: 24
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

  create_table "apportionment_per_greenhouses", force: :cascade do |t|
    t.date     "event_date"
    t.integer  "administration_cost_id", limit: 4
    t.integer  "greenhouse_id",          limit: 4
    t.float    "percentage",             limit: 24
    t.float    "amount",                 limit: 24
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "assistances", force: :cascade do |t|
    t.integer  "employee_id",      limit: 4
    t.date     "assistance_date"
    t.boolean  "assisted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pay_roll_item_id", limit: 4
    t.boolean  "payed"
    t.integer  "greenhouse_id",    limit: 4
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.text     "description",             limit: 65535
    t.text     "address",                 limit: 65535
    t.string   "telephone",               limit: 255
    t.integer  "greenhouse_ids",          limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_ids",                limit: 4
    t.integer  "role_id",                 limit: 4
    t.integer  "administration_cost_ids", limit: 4
  end

  create_table "cycles", force: :cascade do |t|
    t.integer  "greenhouse_id",                         limit: 4
    t.string   "name",                                  limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.float    "estimated_performance_per_m2",          limit: 24
    t.float    "greenhouse_estimated_performance",      limit: 24
    t.float    "maximum_estimated_production_cost",     limit: 24
    t.float    "expected_average_selling_price_per_kg", limit: 24
    t.float    "expected_total_expenses",               limit: 24
    t.float    "expected_total_profit",                 limit: 24
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.boolean  "active"
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

  create_table "environmental_conditions", force: :cascade do |t|
    t.date     "event_date"
    t.integer  "greenhouse_id",    limit: 4
    t.integer  "environment_id",   limit: 4
    t.float    "max_temp",         limit: 24
    t.float    "min_temp",         limit: 24
    t.float    "max_rel_humidity", limit: 24
    t.float    "min_rel_humidity", limit: 24
    t.integer  "weather_id",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "environments", force: :cascade do |t|
    t.string   "name",                        limit: 255
    t.text     "description",                 limit: 65535
    t.integer  "environmental_condition_ids", limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "fertigation_items", force: :cascade do |t|
    t.integer  "fertigation_id",           limit: 4
    t.integer  "application_product_id",   limit: 4
    t.float    "fertilizer_quantity",      limit: 24
    t.float    "concentration",            limit: 24
    t.float    "injection_rate",           limit: 24
    t.float    "fertilizer_cost_per_unit", limit: 24
    t.float    "cost",                     limit: 24
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "unit_type_id",             limit: 4
  end

  create_table "fertigations", force: :cascade do |t|
    t.integer  "greenhouse_id",        limit: 4
    t.datetime "fertigation_datetime"
    t.string   "tank",                 limit: 255
    t.integer  "fertigation_item_ids", limit: 4
    t.float    "total_cost",           limit: 24
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.float    "h2o_quantity",         limit: 24
  end

  create_table "greenhouse_employees", force: :cascade do |t|
    t.integer  "greenhouse_id", limit: 4
    t.integer  "employee_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "greenhouses", force: :cascade do |t|
    t.string   "name",                        limit: 255
    t.string   "description",                 limit: 255
    t.string   "location",                    limit: 255
    t.integer  "greenhouse_employee_ids",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_ids",             limit: 4
    t.integer  "operating_cost_ids",          limit: 4
    t.integer  "application_product_buy_ids", limit: 4
    t.integer  "leachate_ids",                limit: 4
    t.integer  "company_id",                  limit: 4
    t.integer  "cycle_ids",                   limit: 4
    t.integer  "area",                        limit: 4
    t.integer  "pay_roll_ids",                limit: 4
    t.integer  "sale_ids",                    limit: 4
    t.integer  "harvest_ids",                 limit: 4
    t.integer  "assistance_ids",              limit: 4
  end

  create_table "harvests", force: :cascade do |t|
    t.date     "event_date"
    t.integer  "greenhouse_id",           limit: 4
    t.integer  "product_id",              limit: 4
    t.integer  "product_variety_id",      limit: 4
    t.integer  "product_presentation_id", limit: 4
    t.float    "product_quantity",        limit: 24
    t.float    "total_harvested",         limit: 24
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "job_positions", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "description",  limit: 255
    t.integer  "employee_ids", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leachates", force: :cascade do |t|
    t.date     "event_date"
    t.integer  "greenhouse_id",         limit: 4
    t.float    "ddt",                   limit: 24
    t.float    "ph_nutritive_solution", limit: 24
    t.float    "ce_nutritive_solution", limit: 24
    t.float    "dropper_spending",      limit: 24
    t.float    "ph_leachate",           limit: 24
    t.float    "ce_leachate",           limit: 24
    t.integer  "irrigations",           limit: 4
    t.integer  "phenological_stage_id", limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "operating_costs", force: :cascade do |t|
    t.integer  "greenhouse_id", limit: 4
    t.date     "event_date"
    t.string   "concept",       limit: 255
    t.string   "display",       limit: 255
    t.float    "unit_price",    limit: 24
    t.integer  "quantity",      limit: 4
    t.float    "total",         limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
    t.boolean  "payed"
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
    t.integer  "greenhouse_id",     limit: 4
    t.boolean  "payed"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "role_permission_ids", limit: 4
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "value",               limit: 255
  end

  create_table "phenological_stages", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "description",  limit: 255
    t.integer  "leachate_ids", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "product_application_buys", force: :cascade do |t|
    t.date     "buy_date"
    t.integer  "application_product_id", limit: 4
    t.float    "quanity",                limit: 24
    t.float    "unit_cost",              limit: 24
    t.float    "total_cost",             limit: 24
    t.integer  "supplier_id",            limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "unit_type_id",           limit: 4
  end

  create_table "product_presentations", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.integer  "harvest_ids",   limit: 4
    t.integer  "selection_ids", limit: 4
    t.integer  "sale_ids",      limit: 4
    t.integer  "product_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "unit_type_id",  limit: 4
    t.integer  "quantity",      limit: 4
  end

  create_table "product_qualities", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "description",        limit: 255
    t.integer  "selection_item_ids", limit: 4
    t.integer  "sale_item_ids",      limit: 4
    t.integer  "product_id",         limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "product_varieties", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.integer  "harvest_ids",   limit: 4
    t.integer  "selection_ids", limit: 4
    t.integer  "sale_ids",      limit: 4
    t.integer  "product_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.text     "description",              limit: 65535
    t.integer  "product_variety_ids",      limit: 4
    t.integer  "product_presentation_ids", limit: 4
    t.integer  "product_quality_ids",      limit: 4
    t.integer  "harvest_ids",              limit: 4
    t.integer  "selection_ids",            limit: 4
    t.integer  "sale_ids",                 limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "role_permissions", force: :cascade do |t|
    t.integer  "role_id",       limit: 4
    t.integer  "permission_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "company_id",          limit: 4
    t.integer  "user_role_ids",       limit: 4
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.integer  "role_permission_ids", limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "sale_items", force: :cascade do |t|
    t.integer  "sale_id",            limit: 4
    t.integer  "product_quality_id", limit: 4
    t.integer  "quantity",           limit: 4
    t.float    "unit_price",         limit: 24
    t.float    "total_price",        limit: 24
    t.string   "status",             limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "sales", force: :cascade do |t|
    t.date     "event_date"
    t.integer  "product_id",              limit: 4
    t.integer  "product_variety_id",      limit: 4
    t.integer  "product_presentation_id", limit: 4
    t.float    "total_price",             limit: 24
    t.string   "status",                  limit: 255
    t.integer  "sale_item_ids",           limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "greenhouse_id",           limit: 4
  end

  create_table "selection_items", force: :cascade do |t|
    t.integer  "selection_id",       limit: 4
    t.integer  "product_quality_id", limit: 4
    t.float    "quantity",           limit: 24
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "selections", force: :cascade do |t|
    t.date     "event_date"
    t.integer  "greenhouse_id",           limit: 4
    t.integer  "product_id",              limit: 4
    t.integer  "product_variety_id",      limit: 4
    t.integer  "product_presentation_id", limit: 4
    t.float    "total_weight",            limit: 24
    t.integer  "selection_item_ids",      limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name",                        limit: 255
    t.text     "description",                 limit: 65535
    t.string   "telephone",                   limit: 255
    t.string   "celphone",                    limit: 255
    t.string   "address",                     limit: 255
    t.string   "contact_name",                limit: 255
    t.string   "email",                       limit: 255
    t.integer  "product_application_buy_ids", limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "unit_conversions", force: :cascade do |t|
    t.integer  "unit_type_id", limit: 4
    t.string   "convert_to",   limit: 255
    t.float    "value",        limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "unit_types", force: :cascade do |t|
    t.string   "name",                        limit: 255
    t.string   "abbreviation",                limit: 255
    t.float    "value",                       limit: 24
    t.string   "metric_system",               limit: 255
    t.boolean  "base"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "product_presentation_ids",    limit: 4
    t.integer  "application_item_ids",        limit: 4
    t.integer  "application_product_ids",     limit: 4
    t.integer  "product_application_buy_ids", limit: 4
    t.string   "measure_type",                limit: 255
    t.integer  "unit_converion_ids",          limit: 4
    t.integer  "fertigation_item_ids",        limit: 4
  end

  create_table "user_companies", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "company_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "company_ids",            limit: 4
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "second_last_name",       limit: 255
    t.integer  "user_role_ids",          limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weathers", force: :cascade do |t|
    t.string   "name",                        limit: 255
    t.text     "description",                 limit: 65535
    t.integer  "environmental_condition_ids", limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

end
