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
    t.text    "punahou_graduation_year",             limit: 65535
    t.text    "gender",                              limit: 65535
    t.text    "major",                               limit: 65535
    t.text    "academic_environment1",               limit: 65535
    t.text    "academic_environment2",               limit: 65535
    t.text    "academic_competition",                limit: 65535
    t.text    "academic_challenge",                  limit: 65535
    t.text    "ap_honors_classes",                   limit: 65535
    t.text    "class_sizes",                         limit: 65535
    t.text    "most_common_class_size",              limit: 65535
    t.boolean "teaching_assistants"
    t.text    "professor_accessibility",             limit: 65535
    t.text    "academic_advisor_accessibility",      limit: 65535
    t.text    "teacher_assistant_accessibility",     limit: 65535
    t.text    "library_facilities",                  limit: 65535
    t.text    "arts_facilities",                     limit: 65535
    t.text    "comments_library_arts",               limit: 65535
    t.text    "course_registration_difficulty",      limit: 65535
    t.text    "course_rigor",                        limit: 65535
    t.text    "recommendation",                      limit: 65535
    t.text    "academic_life_stereotypes",           limit: 65535
    t.text    "class_discussions",                   limit: 65535
    t.text    "administration_attitude",             limit: 65535
    t.text    "social_life",                         limit: 65535
    t.text    "friendship_making",                   limit: 65535
    t.text    "campus_life",                         limit: 65535
    t.text    "comments_friendship_social_campus",   limit: 65535
    t.text    "activities",                          limit: 65535
    t.text    "extracurricular_involvement_ability", limit: 65535
    t.text    "food_quality_on_campus",              limit: 65535
    t.text    "residence_halls",                     limit: 65535
    t.text    "recommended_dorms",                   limit: 65535
    t.text    "athletic_accessibility",              limit: 65535
    t.text    "student_center_unique_features",      limit: 65535
    t.text    "overall_social_satisfaction",         limit: 65535
    t.text    "social_life_recommendation",          limit: 65535
    t.text    "social_life_rumors",                  limit: 65535
    t.text    "safe_unsafe",                         limit: 65535
    t.text    "spirit_pride",                        limit: 65535
    t.text    "college_nearby_community",            limit: 65535
    t.text    "neighboring_community_activities",    limit: 65535
    t.text    "why_chose_school",                    limit: 65535
    t.text    "overall_satisfaction",                limit: 65535
    t.text    "choose_again",                        limit: 65535
    t.text    "advice",                              limit: 65535
    t.text    "name",                                limit: 65535
    t.text    "email",                               limit: 65535
    t.text    "phone",                               limit: 65535
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
