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

ActiveRecord::Schema.define(version: 20161231003156) do

  create_table "colleges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "unitid"
  end

  create_table "rankings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "college_name"
    t.string "response1"
    t.text   "response1_explanation",  limit: 65535
    t.string "response2"
    t.text   "response2_explanation",  limit: 65535
    t.string "response3"
    t.text   "response3_explanation",  limit: 65535
    t.string "response4"
    t.text   "response4_explanation",  limit: 65535
    t.string "response5"
    t.text   "response5_explanation",  limit: 65535
    t.string "response6"
    t.text   "response6_explanation",  limit: 65535
    t.string "response7"
    t.text   "response7_explanation",  limit: 65535
    t.string "response8"
    t.text   "response8_explanation",  limit: 65535
    t.string "response9"
    t.text   "response9_explanation",  limit: 65535
    t.string "response10"
    t.text   "response10_explanation", limit: 65535
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text   "question1",    limit: 65535
    t.string "name"
    t.string "college_name"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest"
    t.string   "alumni"
    t.integer  "submitted_review",  limit: 1
    t.integer  "submitted_ranking", limit: 1
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
