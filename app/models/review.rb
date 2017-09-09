class Review < ApplicationRecord
    validates(:name, :college_name, :year_completed, :punahou_graduation_year, :gender, :major, :academic_environment1, :academic_environment2, :academic_competition, :academic_challenge, :ap_honors_classes, :class_sizes, :most_common_class_size, :teaching_assistants, :professor_accessibility, :academic_advisor_accessibility, :teacher_assistant_accessibility, :class_or_meeting_at_professors_home, :library_facilities, :science_facilities, :arts_facilities, :comments_library_arts, :course_registration_difficulty, :course_rigor, :recommendation, :academic_life_stereotypes, :class_discussions, :administration_attitude, :social_life, :friendship_making, :campus_life, :comments_friendship_social_campus, :activities, :extracurricular_involvement_ability, :food_quality_on_campus, :residence_halls, :recommended_dorms, :athletic_accessibility, :student_center_unique_features, :overall_social_satisfaction, :social_life_recommendation, :social_life_rumors, :safe_unsafe, :spirit_pride, :college_nearby_community, :neighboring_community_activities, :why_chose_school, :overall_satisfaction, :choose_again, :advice, presence: true)
end
