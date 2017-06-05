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

ActiveRecord::Schema.define(version: 20170601190626) do

  create_table "colleges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "unitid"
    t.integer  "reviews_count"
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "verified",                                          default: false
    t.text    "college_name",                        limit: 65535
    t.integer "punahou_graduation_year"
    t.text    "gender",                              limit: 65535
    t.text    "major",                               limit: 65535
    t.text    "academic_environment1",               limit: 65535
    t.text    "academic_environment2",               limit: 65535
    t.integer "academic_competition"
    t.integer "academic_challenge"
    t.text    "ap_honors_classes",                   limit: 65535
    t.text    "class_sizes",                         limit: 65535
    t.integer "most_common_class_size"
    t.boolean "teaching_assistants"
    t.integer "professor_accessibility"
    t.integer "academic_advisor_accessibility"
    t.integer "teacher_assistant_accessibility"
    t.integer "library_facilities"
    t.integer "arts_facilities"
    t.text    "comments_library_arts",               limit: 65535
    t.integer "course_registration_difficulty"
    t.integer "course_rigor"
    t.integer "recommendation"
    t.text    "academic_life_stereotypes",           limit: 65535
    t.text    "class_discussions",                   limit: 65535
    t.text    "administration_attitude",             limit: 65535
    t.text    "social_life",                         limit: 65535
    t.text    "friendship_making",                   limit: 65535
    t.text    "campus_life",                         limit: 65535
    t.text    "comments_friendship_social_campus",   limit: 65535
    t.text    "activities",                          limit: 65535
    t.integer "extracurricular_involvement_ability"
    t.integer "food_quality_on_campus"
    t.integer "residence_halls"
    t.text    "recommended_dorms",                   limit: 65535
    t.integer "athletic_accessibility"
    t.text    "student_center_unique_features",      limit: 65535
    t.integer "overall_social_satisfaction"
    t.integer "social_life_recommendation"
    t.text    "social_life_rumors",                  limit: 65535
    t.text    "safe_unsafe",                         limit: 65535
    t.text    "spirit_pride",                        limit: 65535
    t.text    "college_nearby_community",            limit: 65535
    t.text    "neighboring_community_activities",    limit: 65535
    t.text    "why_chose_school",                    limit: 65535
    t.integer "overall_satisfaction"
    t.integer "choose_again"
    t.text    "advice",                              limit: 65535
    t.text    "name",                                limit: 65535
    t.text    "email",                               limit: 65535
    t.text    "phone",                               limit: 65535
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "password_digest"
    t.string   "alumni"
    t.integer  "submitted_review", limit: 1
    t.boolean  "admin",                      default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
