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

ActiveRecord::Schema.define(version: 20140309210500) do

  create_table "brought_items", force: true do |t|
    t.integer  "bringer"
    t.string   "item"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "event_datetimes", force: true do |t|
    t.datetime "event_datetime"
    t.string   "who_voted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.boolean  "is_final"
  end

  create_table "events", force: true do |t|
    t.string   "event_name"
    t.string   "event_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active"
    t.string   "pictures"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id"
  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "movies", force: true do |t|
    t.string   "movie_name"
    t.string   "who_voted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.boolean  "is_final"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "last_name"
    t.string   "password_digest"
    t.boolean  "is_active"
    t.string   "email"
    t.string   "facebook_id"
    t.string   "profile_pic_path"
    t.string   "remember_token_digest"
  end

  create_table "venues", force: true do |t|
    t.string   "venue_name"
    t.string   "venue_coordinates"
    t.string   "who_voted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.boolean  "is_final"
  end

end
