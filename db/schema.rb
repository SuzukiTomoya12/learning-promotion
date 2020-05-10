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

ActiveRecord::Schema.define(version: 20200412063212) do

  create_table "experience_points", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "until_next_level",          null: false
    t.integer  "total_required_experience", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "possessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "report_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_possessions_on_report_id", using: :btree
    t.index ["tag_id"], name: "index_possessions_on_tag_id", using: :btree
  end

  create_table "registrations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "level"
    t.integer  "exp"
    t.integer  "until_next_level"
    t.integer  "user_id"
    t.integer  "tag_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["tag_id"], name: "index_registrations_on_tag_id", using: :btree
    t.index ["user_id"], name: "index_registrations_on_user_id", using: :btree
  end

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",                   limit: 65535
    t.text     "image",                     limit: 65535
    t.integer  "total_time_hour",                         null: false
    t.integer  "total_time_minute",                       null: false
    t.integer  "concentration_time_hour",                 null: false
    t.integer  "concentration_time_minute",               null: false
    t.float    "total_time",                limit: 24
    t.float    "concentration_time",        limit: 24
    t.float    "concentration_rate",        limit: 24
    t.integer  "user_id"
    t.integer  "tag_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["tag_id"], name: "index_reports_on_tag_id", using: :btree
    t.index ["user_id"], name: "index_reports_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "ancestry"
    t.text     "description", limit: 65535
    t.text     "image",       limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["name"], name: "index_tags_on_name", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username",                                          null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.text     "avatar",                 limit: 65535
    t.integer  "level",                                             null: false
    t.integer  "exp",                                               null: false
    t.integer  "coin",                                              null: false
    t.text     "profile",                limit: 65535
    t.string   "birthday"
    t.string   "sex"
    t.integer  "background"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["level"], name: "index_users_on_level", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "possessions", "reports"
  add_foreign_key "possessions", "tags"
  add_foreign_key "registrations", "tags"
  add_foreign_key "registrations", "users"
end
