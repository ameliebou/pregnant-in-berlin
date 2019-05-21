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

ActiveRecord::Schema.define(version: 2019_05_21_084150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_kindergartens", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.datetime "date"
    t.string "type"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

end
