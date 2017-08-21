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

ActiveRecord::Schema.define(version: 20170611235907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string  "ability"
    t.integer "employee_id"
  end

  create_table "dependants", force: :cascade do |t|
    t.string   "name"
    t.string   "relation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
    t.string   "email"
    t.string   "phone"
    t.date     "birth_at"
  end

  create_table "educations", force: :cascade do |t|
    t.string   "school_name"
    t.datetime "year_start"
    t.datetime "year_end"
    t.boolean  "completed"
    t.text     "title_description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "employee_id"
    t.string   "constancia"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.index ["employee_id"], name: "index_educations_on_employee_id", using: :btree
  end

  create_table "employee_abilities", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "ability_id"
    t.integer "training_id"
    t.index ["ability_id"], name: "index_employee_abilities_on_ability_id", using: :btree
    t.index ["employee_id"], name: "index_employee_abilities_on_employee_id", using: :btree
  end

  create_table "employee_trainings", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "training_id"
    t.index ["employee_id"], name: "index_employee_trainings_on_employee_id", using: :btree
    t.index ["training_id"], name: "index_employee_trainings_on_training_id", using: :btree
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.text     "profession"
    t.date     "birth_at"
    t.text     "birth_place"
    t.date     "date_admission"
    t.decimal  "salary"
    t.string   "base_belong"
    t.string   "civil_status"
    t.text     "address"
    t.string   "blood_type"
    t.string   "emergency_contact_name"
    t.integer  "emergency_contact_number"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "work_id"
    t.string   "last_work"
    t.string   "email"
    t.string   "RAP_code"
    t.integer  "cellphone"
    t.integer  "bank_account"
    t.string   "contract_type"
    t.string   "gender"
    t.boolean  "employee_status"
    t.string   "supression_motive"
    t.datetime "supression_date"
    t.string   "identity_number"
    t.integer  "position_id"
    t.string   "avatar"
    t.integer  "work_structure_id"
    t.integer  "ability_id"
    t.boolean  "hasChildren"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "monthly_permissions"
    t.integer  "annual_permissions"
    t.index ["position_id"], name: "index_employees_on_position_id", using: :btree
  end

  create_table "horas", force: :cascade do |t|
    t.integer  "employee_id"
    t.datetime "fecha"
    t.time     "hora_entrada"
    t.time     "hora_salida"
  end

  create_table "hours", force: :cascade do |t|
    t.integer  "employee_id"
    t.datetime "date"
    t.datetime "time_in"
    t.datetime "time_out"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "scheduletype"
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "description"
    t.string   "phone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "description"
    t.string   "phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "institution_id"
    t.index ["institution_id"], name: "index_instructors_on_institution_id", using: :btree
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "employee_id"
    t.datetime "time_in"
    t.datetime "time_out"
    t.string   "permission_type"
    t.text     "description"
  end

  create_table "position_abilities", force: :cascade do |t|
    t.integer "position_id"
    t.integer "ability_id"
    t.index ["ability_id"], name: "index_position_abilities_on_ability_id", using: :btree
    t.index ["position_id"], name: "index_position_abilities_on_position_id", using: :btree
  end

  create_table "position_trainings", force: :cascade do |t|
    t.integer "position_id"
    t.integer "training_id"
    t.index ["position_id"], name: "index_position_trainings_on_position_id", using: :btree
    t.index ["training_id"], name: "index_position_trainings_on_training_id", using: :btree
  end

  create_table "positions", force: :cascade do |t|
    t.text     "name_position"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "work_structure_id"
    t.index ["work_structure_id"], name: "index_positions_on_work_structure_id", using: :btree
  end

  create_table "training_abilities", force: :cascade do |t|
    t.integer "ability_id"
    t.integer "training_id"
    t.index ["ability_id"], name: "index_training_abilities_on_ability_id", using: :btree
    t.index ["training_id"], name: "index_training_abilities_on_training_id", using: :btree
  end

  create_table "training_employees", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "training_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "asistencia"
  end

  create_table "trainings", force: :cascade do |t|
    t.string   "training_name"
    t.boolean  "check_employee"
    t.boolean  "check_intern"
    t.boolean  "check_exterior"
    t.integer  "duration"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "instructor_id"
    t.integer  "institution_id"
    t.boolean  "planned"
    t.string   "category"
    t.boolean  "asistenciaConfirmada"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "work_exps", force: :cascade do |t|
    t.string   "company_name"
    t.datetime "year_start"
    t.datetime "year_end"
    t.text     "position"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "employee_id"
    t.string   "constancia"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.index ["employee_id"], name: "index_work_exps_on_employee_id", using: :btree
  end

  create_table "work_structure_abilities", force: :cascade do |t|
    t.integer  "ability_id"
    t.integer  "work_structure_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "work_structures", force: :cascade do |t|
    t.string   "department"
    t.string   "area"
    t.string   "sub_area"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "field_code"
    t.string   "area_code"
    t.string   "code_department"
  end

  add_foreign_key "educations", "employees"
  add_foreign_key "employee_abilities", "abilities"
  add_foreign_key "employee_abilities", "employees"
  add_foreign_key "employee_trainings", "employees"
  add_foreign_key "employee_trainings", "trainings"
  add_foreign_key "employees", "positions"
  add_foreign_key "hours", "employees"
  add_foreign_key "instructors", "institutions"
  add_foreign_key "position_abilities", "abilities"
  add_foreign_key "position_abilities", "positions"
  add_foreign_key "position_trainings", "positions"
  add_foreign_key "position_trainings", "trainings"
  add_foreign_key "positions", "work_structures"
  add_foreign_key "training_abilities", "abilities"
  add_foreign_key "training_abilities", "trainings"
  add_foreign_key "work_exps", "employees"
end
