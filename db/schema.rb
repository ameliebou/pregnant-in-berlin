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

ActiveRecord::Schema.define(version: 2020_03_25_152932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kindergartens", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "phone_number"
    t.string "email"
    t.integer "places"
    t.integer "places_under_three"
    t.integer "places_over_three"
    t.integer "minimum_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "open_time_mon"
    t.string "open_time_tue"
    t.string "open_time_wed"
    t.string "open_time_thu"
    t.string "open_time_fri"
    t.string "url"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "kita_contacts", force: :cascade do |t|
    t.string "contact_type"
    t.text "note"
    t.bigint "user_id"
    t.bigint "kindergarten_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kindergarten_id"], name: "index_kita_contacts_on_kindergarten_id"
    t.index ["user_id"], name: "index_kita_contacts_on_user_id"
  end

  create_table "kita_reminders", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "date"
    t.bigint "user_id"
    t.bigint "kindergarten_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kindergarten_id"], name: "index_kita_reminders_on_kindergarten_id"
    t.index ["user_id"], name: "index_kita_reminders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "duedate"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "kita_contacts", "kindergartens"
  add_foreign_key "kita_contacts", "users"
  add_foreign_key "kita_reminders", "kindergartens"
  add_foreign_key "kita_reminders", "users"
end
