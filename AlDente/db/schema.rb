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

ActiveRecord::Schema.define(version: 20141107005108) do

  create_table "items", force: true do |t|
    t.string   "name"
    t.decimal  "cost"
    t.string   "category"
    t.boolean  "available"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "tax_percentage"
    t.text     "description"
  end

  create_table "ordered_items", force: true do |t|
    t.integer  "session_id"
    t.integer  "item_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.text     "waiter_name"
    t.integer  "ipad_id"
    t.integer  "restaurant_id"
    t.integer  "pin"
    t.integer  "party_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "restaurant_id"
    t.string   "role"
    t.boolean  "active"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_confirmation"
  end

end
