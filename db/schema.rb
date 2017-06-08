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

ActiveRecord::Schema.define(version: 20170602031610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "description"
    t.string   "accomodates_no_persons"
    t.string   "address"
    t.string   "city"
    t.string   "price"
    t.string   "photo_url"
    t.boolean  "smooking"
    t.boolean  "pet_friendly"
    t.boolean  "apartment"
    t.boolean  "house"
    t.integer  "house_type"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "photos"
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "message_threads", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "title"
    t.text     "message"
    t.boolean  "read"
    t.integer  "message_thread_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "reservation_id"
    t.integer  "total_amount"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "payments", ["reservation_id"], name: "index_payments_on_reservation_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "user_id"
    t.text     "review"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128
    t.integer  "role",                           default: 0
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "authentications", "users"
  add_foreign_key "listings", "users"
  add_foreign_key "payments", "reservations"
end
