class AddQuestionsToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :college_name, :text
    add_column :reviews, :punahou_graduation_year, :text
    add_column :reviews, :gender, :text
    add_column :reviews, :major, :text
    add_column :reviews, :academic_environment1, :text
    add_column :reviews, :academic_environment2, :text
    add_column :reviews, :academic_competition, :text
    add_column :reviews, :academic_challenge, :text
    add_column :reviews, :ap_honors_classes, :text
    add_column :reviews, :class_sizes, :text
    add_column :reviews, :most_common_class_size, :text
    add_column :reviews, :teaching_assistants, :bool
    add_column :reviews, :professor_accessibility, :text
    add_column :reviews, :academic_advisor_accessibility, :text
    add_column :reviews, :teacher_assistant_accessibility, :text
    add_column :reviews, :library_facilities, :text
    add_column :reviews, :arts_facilities, :text
    add_column :reviews, :comments_library_arts, :text
    add_column :reviews, :course_registration_difficulty, :text
    add_column :reviews, :course_rigor, :text
    add_column :reviews, :recommendation, :text
    add_column :reviews, :academic_life_stereotypes, :text
    add_column :reviews, :class_discussions, :text
    add_column :reviews, :administration_attitude, :text
    add_column :reviews, :social_life, :text
    add_column :reviews, :friendship_making, :text
    add_column :reviews, :campus_life, :text
    add_column :reviews, :comments_friendship_social_campus, :text
    add_column :reviews, :activities, :text
    add_column :reviews, :extracurricular_involvement_ability, :text
    add_column :reviews, :food_quality_on_campus, :text
    add_column :reviews, :residence_halls, :text
    add_column :reviews, :recommended_dorms, :text
    add_column :reviews, :athletic_accessibility, :text
    add_column :reviews, :student_center_unique_features, :text
    add_column :reviews, :overall_social_satisfaction, :text
    add_column :reviews, :social_life_recommendation, :text
    add_column :reviews, :social_life_rumors, :text
    add_column :reviews, :safe_unsafe, :text
    add_column :reviews, :spirit_pride, :text
    add_column :reviews, :college_nearby_community, :text
    add_column :reviews, :neighboring_community_activities, :text
    add_column :reviews, :why_chose_school, :text
    add_column :reviews, :overall_satisfaction, :text
    add_column :reviews, :choose_again, :text
    add_column :reviews, :advice, :text
    add_column :reviews, :name, :text
    add_column :reviews, :email, :text
    add_column :reviews, :phone, :text
  end
end
