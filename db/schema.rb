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

ActiveRecord::Schema.define(version: 20151215211437) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.text     "text"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "follows", force: true do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows"

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.string   "show_name"
    t.string   "imdb_link"
    t.text     "text"
    t.integer  "wall_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "email"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"
  add_index "posts", ["wall_id"], name: "index_posts_on_wall_id"

  create_table "users", force: true do |t|
    t.string   "email",              null: false
    t.string   "encrypted_password", null: false
    t.string   "username"
    t.string   "f_name"
    t.string   "l_name"
    t.string   "country"
    t.string   "city"
    t.string   "date_of_birth"
    t.integer  "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "walls", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "walls", ["user_id"], name: "index_walls_on_user_id"

end
