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

ActiveRecord::Schema.define(version: 20160209143032) do

  create_table "comments", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "video_id",   limit: 4
    t.integer  "news_id",    limit: 4
    t.boolean  "aprove",                   default: false
  end

  add_index "comments", ["news_id"], name: "index_comments_on_news_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree
  add_index "comments", ["video_id"], name: "index_comments_on_video_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "friendable_id",   limit: 4
    t.string   "friendable_type", limit: 255
    t.integer  "friend_id",       limit: 4
    t.string   "status",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blocker_id",      limit: 4
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "news_tags", force: :cascade do |t|
    t.integer  "news_id",    limit: 4
    t.integer  "tag_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "news_tags", ["news_id"], name: "index_news_tags_on_news_id", using: :btree
  add_index "news_tags", ["tag_id"], name: "index_news_tags_on_tag_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "value",      limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "password_digest", limit: 255
    t.string   "remember_digest", limit: 255
    t.boolean  "admin",                       default: false
    t.string   "reset_digest",    limit: 255
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "video_tags", force: :cascade do |t|
    t.integer  "video_id",   limit: 4
    t.integer  "tag_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "video_tags", ["tag_id"], name: "index_video_tags_on_tag_id", using: :btree
  add_index "video_tags", ["video_id"], name: "index_video_tags_on_video_id", using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "link",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "videos", ["link"], name: "index_videos_on_link", unique: true, using: :btree

  add_foreign_key "comments", "news"
  add_foreign_key "comments", "users"
  add_foreign_key "comments", "videos"
  add_foreign_key "news_tags", "news"
  add_foreign_key "news_tags", "tags"
  add_foreign_key "ratings", "users"
  add_foreign_key "video_tags", "tags"
  add_foreign_key "video_tags", "videos"
end
