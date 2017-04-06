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

ActiveRecord::Schema.define(version: 20170406202042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carriages", force: :cascade do |t|
    t.integer  "number"
    t.integer  "train_id"
    t.integer  "bottom_places",      default: 0
    t.integer  "top_places",         default: 0
    t.string   "type"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "side_top_places",    default: 0
    t.integer  "side_bottom_places", default: 0
    t.integer  "seat_places",        default: 0
    t.integer  "serial"
    t.index ["train_id"], name: "index_carriages_on_train_id", using: :btree
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rel_railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "sort_key",           default: 0
    t.time    "departure_time"
    t.time    "arrival_time"
    t.index ["railway_station_id"], name: "index_rel_railway_stations_routes_on_railway_station_id", using: :btree
    t.index ["route_id"], name: "index_rel_railway_stations_routes_on_route_id", using: :btree
  end

  create_table "routes", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "train_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "departure_id"
    t.integer  "arrival_id"
    t.index ["train_id"], name: "index_tickets_on_train_id", using: :btree
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
  end

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "route_id"
    t.integer  "current_station_id"
    t.boolean  "reverse_cars_sort",  default: false
    t.index ["current_station_id"], name: "index_trains_on_current_station_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "carriages", "trains"
  add_foreign_key "rel_railway_stations_routes", "railway_stations"
  add_foreign_key "rel_railway_stations_routes", "routes"
  add_foreign_key "tickets", "railway_stations", column: "arrival_id"
  add_foreign_key "tickets", "railway_stations", column: "departure_id"
  add_foreign_key "tickets", "trains"
  add_foreign_key "tickets", "users"
  add_foreign_key "trains", "railway_stations", column: "current_station_id"
end
