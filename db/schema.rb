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

ActiveRecord::Schema.define(version: 20150806200945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audio_infos", force: :cascade do |t|
    t.integer "duration"
    t.integer "size"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "image_infos", force: :cascade do |t|
    t.integer "width"
    t.integer "height"
    t.string  "mime_type"
  end

  create_table "media", force: :cascade do |t|
    t.string   "url"
    t.integer  "user_id"
    t.integer  "media_info_id"
    t.string   "media_info_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "media", ["media_info_type", "media_info_id"], name: "index_media_on_media_info_type_and_media_info_id", using: :btree
  add_index "media", ["user_id"], name: "index_media_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_infos", force: :cascade do |t|
    t.integer "width"
    t.integer "height"
    t.integer "duration"
  end

end
