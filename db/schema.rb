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

ActiveRecord::Schema.define(version: 20160801125834) do

  create_table "cars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.float    "latitude",               limit: 24
    t.float    "longitude",              limit: 24
    t.integer  "num_of_seats"
    t.integer  "num_of_seats_available"
    t.datetime "leave"
    t.datetime "return"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["event_id"], name: "index_cars_on_event_id", using: :btree
    t.index ["user_id"], name: "index_cars_on_user_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "priority",                 default: 0, null: false
    t.integer  "attempts",                 default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.text     "description", limit: 16777215
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.decimal  "latitude",                     precision: 10
    t.decimal  "longitude",                    precision: 10
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "lookup_id"
  end

  create_table "facebook_friends", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "facebook_id"
    t.integer  "friend_user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["friend_user_id"], name: "index_facebook_friends_on_friend_user_id", using: :btree
    t.index ["user_id"], name: "index_facebook_friends_on_user_id", using: :btree
  end

  create_table "passengers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.float    "latitude",           limit: 24
    t.float    "longitude",          limit: 24
    t.integer  "seats_requested"
    t.integer  "seats_still_needed"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["event_id"], name: "index_passengers_on_event_id", using: :btree
    t.index ["user_id"], name: "index_passengers_on_user_id", using: :btree
  end

  create_table "states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.boolean  "swing",        default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "facebook_id"
    t.string   "facebook_token"
    t.string   "photo_url"
    t.boolean  "citizen"
    t.boolean  "registered"
    t.boolean  "with_her"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "friends_count",          default: 0,  null: false
    t.datetime "last_friends_count"
    t.string   "phone"
    t.string   "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["facebook_id"], name: "index_users_on_facebook_id", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["state"], name: "index_users_on_state", using: :btree
  end

end
