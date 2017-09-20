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

ActiveRecord::Schema.define(version: 20150915091854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "beknown_entries", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.string   "slug"
    t.json     "payload"
    t.boolean  "draft",        default: false
    t.integer  "user_id"
    t.string   "author_name"
    t.datetime "published_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "beknown_entries", ["slug"], name: "index_beknown_entries_on_slug", using: :btree
  add_index "beknown_entries", ["type"], name: "index_beknown_entries_on_type", using: :btree
  add_index "beknown_entries", ["user_id"], name: "index_beknown_entries_on_user_id", using: :btree

  create_table "beknown_entries_search_data", force: :cascade do |t|
    t.integer  "entry_id"
    t.string   "attr_name"
    t.tsvector "search_data"
    t.text     "raw_data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "beknown_entries_search_data", ["entry_id"], name: "index_beknown_entries_search_data_on_entry_id", using: :btree

  create_table "beknown_entry_search_data", force: :cascade do |t|
    t.integer  "entry_id"
    t.string   "attr_name"
    t.tsvector "search_data"
    t.text     "raw_data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "beknown_entry_search_data", ["entry_id"], name: "index_beknown_entry_search_data_on_entry_id", using: :btree
  add_index "beknown_entry_search_data", ["search_data"], name: "idx_search_data", using: :gin

end
