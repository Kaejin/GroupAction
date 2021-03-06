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

ActiveRecord::Schema.define(version: 20170503132239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "charities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.float    "amount_raised",  default: 0.0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "mission"
    t.string   "bio"
    t.string   "charity_number"
    t.index ["user_id"], name: "index_charities_on_user_id", using: :btree
  end

  create_table "direct_donations", force: :cascade do |t|
    t.float    "amount"
    t.integer  "user_id"
    t.integer  "fundraiser_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "message"
    t.index ["fundraiser_id"], name: "index_direct_donations_on_fundraiser_id", using: :btree
    t.index ["user_id"], name: "index_direct_donations_on_user_id", using: :btree
  end

  create_table "event_donations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "message"
    t.index ["event_id"], name: "index_event_donations_on_event_id", using: :btree
    t.index ["user_id"], name: "index_event_donations_on_user_id", using: :btree
  end

  create_table "event_updates", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "title"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "link"
    t.index ["event_id"], name: "index_event_updates_on_event_id", using: :btree
  end

  create_table "event_videos", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "link"
    t.string   "title"
    t.integer  "likes",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["event_id"], name: "index_event_videos_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "fundraiser_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.date     "start_date"
    t.boolean  "active",        default: true
    t.float    "amount_raised", default: 0.0
    t.float    "target"
    t.index ["fundraiser_id"], name: "index_events_on_fundraiser_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "fundraiser_updates", force: :cascade do |t|
    t.integer  "fundraiser_id"
    t.string   "title"
    t.string   "message"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "link"
    t.index ["fundraiser_id"], name: "index_fundraiser_updates_on_fundraiser_id", using: :btree
  end

  create_table "fundraiser_videos", force: :cascade do |t|
    t.integer  "fundraiser_id"
    t.string   "link"
    t.string   "title"
    t.integer  "likes",         default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["fundraiser_id"], name: "index_fundraiser_videos_on_fundraiser_id", using: :btree
  end

  create_table "fundraisers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "title"
    t.date     "end_date"
    t.float    "target"
    t.float    "amount_raised", default: 0.0
    t.boolean  "active",        default: true
    t.string   "goal"
    t.index ["user_id"], name: "index_fundraisers_on_user_id", using: :btree
  end

  create_table "offline_donations", force: :cascade do |t|
    t.float    "amount"
    t.string   "message"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_type", "imageable_id"], name: "index_offline_donations_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_charity",             default: false
    t.boolean  "verified",               default: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "friend_uids",            default: [],                 array: true
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "volunteers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "goal"
    t.index ["user_id"], name: "index_volunteers_on_user_id", using: :btree
  end

  add_foreign_key "charities", "users"
  add_foreign_key "direct_donations", "fundraisers"
  add_foreign_key "direct_donations", "users"
  add_foreign_key "event_donations", "events"
  add_foreign_key "event_donations", "users"
  add_foreign_key "event_updates", "events"
  add_foreign_key "event_videos", "events"
  add_foreign_key "events", "fundraisers"
  add_foreign_key "events", "users"
  add_foreign_key "fundraiser_updates", "fundraisers"
  add_foreign_key "fundraiser_videos", "fundraisers"
  add_foreign_key "fundraisers", "users"
  add_foreign_key "volunteers", "users"
end
