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

ActiveRecord::Schema.define(version: 20161103195459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.string "address"
  end

  create_table "meetup_times", force: :cascade do |t|
    t.string "hour"
    t.string "minute"
    t.string "suffix"
  end

  create_table "seats", force: :cascade do |t|
    t.integer  "role"
    t.integer  "driver_id"
    t.integer  "passenger_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "trips_id"
    t.index ["driver_id"], name: "index_seats_on_driver_id", using: :btree
    t.index ["passenger_id"], name: "index_seats_on_passenger_id", using: :btree
    t.index ["trips_id"], name: "index_seats_on_trips_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "meetup_times_id"
    t.integer  "pickup_id"
    t.integer  "dropoff_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["dropoff_id"], name: "index_trips_on_dropoff_id", using: :btree
    t.index ["meetup_times_id"], name: "index_trips_on_meetup_times_id", using: :btree
    t.index ["pickup_id"], name: "index_trips_on_pickup_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.integer  "role"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_foreign_key "seats", "trips", column: "trips_id"
  add_foreign_key "seats", "users", column: "driver_id"
  add_foreign_key "seats", "users", column: "passenger_id"
  add_foreign_key "trips", "destinations", column: "dropoff_id"
  add_foreign_key "trips", "destinations", column: "pickup_id"
  add_foreign_key "trips", "meetup_times", column: "meetup_times_id"
end
