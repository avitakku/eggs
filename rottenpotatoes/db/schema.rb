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

ActiveRecord::Schema.define(version: 20231024225439) do

  create_table "goods_and_services", force: :cascade do |t|
    t.string   "user_id"
    t.string   "name"
    t.integer  "category"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goods_and_services", ["user_id"], name: "index_goods_and_services_on_user_id"

  create_table "user_informations", force: :cascade do |t|
    t.string   "user_id"
    t.string   "username"
    t.string   "name"
    t.string   "contact_information"
    t.string   "address"
    t.float    "rating"
    t.string   "photo_url"
    t.text     "friends",             default: "--- []\n"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_informations", ["user_id"], name: "index_user_informations_on_user_id", unique: true

end
