# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_113_010_146) do
  create_table 'branches', force: :cascade do |t|
    t.string 'name'
    t.string 'direction'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'checks', force: :cascade do |t|
    t.datetime 'entrance'
    t.datetime 'out'
    t.integer 'employee_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['employee_id'], name: 'index_checks_on_employee_id'
  end

  create_table 'employees', force: :cascade do |t|
    t.string 'name'
    t.string 'position'
    t.string 'email'
    t.boolean 'active'
    t.integer 'branch_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['branch_id'], name: 'index_employees_on_branch_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'checks', 'employees'
  add_foreign_key 'employees', 'branches'
end
