class ReviewsController < ApplicationController
  def index
  end
  
  def new
    @review = Review.new
    @colleges = College.all
  end
  
  def create
      @review = Review.new(review_params)

      if @review.save
        flash[:success] = "Review successfully submitted. It is awaiting evaluation by a college counselor"
        redirect_to root_path
      else
        flash.now[:danger] = "Error submitting review, please ensure you answer all the questions"
        render :new
      end
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def destroy
    @review = Review.find(params[:id])
    
    @college = College.find_by(name: @review.college_name)
    if @college && @college.update_attribute(:reviews_count, @college.reviews_count - 1)
    
    end

    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to reviews_path
  end
  
  def verify
    r = Review.find(params[:id])
    r.update_attribute(:verified, true)
    
    college = College.find_by(name: r.college_name)
    if college
      college.update_attribute(:reviews_count, college.reviews_count + 1)
    end
    redirect_to reviews_path
    flash[:success] = "Review Verified!"
  end
  
  private
    def review_params
      params.require(:review).permit(:college_name, :punahou_graduation_year, :gender, :major, :academic_environment1, :academic_environment2, :academic_competition, :academic_challenge, :ap_honors_classes, :most_common_class_size, :teaching_assistants, :professor_accessibility, :academic_advisor_accessibility, :teacher_assistant_accessibility, :library_facilities, :arts_facilities, :comments_library_arts, :course_registration_difficulty, :course_rigor, :recommendation, :academic_life_stereotypes,  :class_discussions, :administration_attitude, :comments_friendship_social_campus, :extracurricular_involvement_ability, :food_quality_on_campus, :residence_halls, :recommended_dorms, :athletic_accessibility, :student_center_unique_features, :overall_social_satisfaction, :social_life_recommendation, :social_life_rumors, :safe_unsafe, :spirit_pride, :college_nearby_community, :neighboring_community_activities, :overall_satisfaction, :choose_again, :advice,  :name, :email, :class_sizes => [], :social_life => [], :friendship_making => [], :campus_life => [], :activities => [], :why_chose_school => [])
    end
end
