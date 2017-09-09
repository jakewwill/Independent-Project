class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @colleges = College.all
    @collegeNames = ""
    
    @colleges.each do |college|
      @collegeNames += college.name + ";:"
    end
  end
  
  def create
      @review = Review.new(review_params)
  
      if @review.save
          flash[:success] = "Review successfully submitted. It is awaiting evaluation by a college counselor"
          redirect_to root_path
      else
        @errors = Array.new
        counter = -1
        @review.attributes.each do |name, val|
          puts (name + ": " + val.to_s + "        " + counter.to_s)
          if counter > 0 && ((val != true && val != false) && (val == nil || val.length == 0)) && counter < 50
            @errors.push(counter)
          end
          
          if (name != "professor_accessibility" && name != "academic_advisor_accessibility")
            counter = counter + 1
          end
        end
        
        @error_string = ""
        
        count = 0
        @errors.each do |err|
          if (count != @errors.length - 1)
            @error_string = @error_string + err.to_s + ", "
          else
            @error_string = @error_string + err.to_s
          end
          count = count + 1
        end
        
        flash.now[:danger] = "Error submitting review, please answer the questions: " + @error_string
        render :new
      end
  end

  def show
    @review = Review.find(params[:id])

    if @review.verified != true && (current_user == nil)
      flash[:danger] = "Error! This review has not been verified by a college counselor"
      redirect_to root_path
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    if (@review)
      @college = College.find_by(name: @review.college_name)
      
      # I put this in an if statement to eliminate bugs surround non-existant colleges
      if @college && @college.update_attribute(:reviews_count, @college.reviews_count - 1)
      
      end
  
      @review.destroy
      flash[:success] = "Review deleted"
      redirect_to reviews_path
    else
      flash[:danger] = "That review has already been deleted"
      redirect_to reviews_path
    end
  end
  
  def verify
    r = Review.find(params[:id])
    # Check for concurrency issues
    if r.verified == false
       r.update_attribute(:verified, true)
    
      college = College.find_by(name: r.college_name)
      if college
        college.update_attribute(:reviews_count, college.reviews_count + 1)
      end
    end
   
    redirect_to reviews_path
    flash[:success] = "Review Verified!"
  end
  
  private
    def review_params
      params.require(:review).permit(:college_name, :punahou_graduation_year, :gender, :year_completed, :major, :academic_environment1, :academic_environment2, :academic_competition, :academic_challenge, :ap_honors_classes, :most_common_class_size, :teaching_assistants, :teaching_rating, :professor_accessibility, :academic_advisor_accessibility, :teacher_assistant_accessibility, :class_or_meeting_at_professors_home, :library_facilities, :science_facilities, :arts_facilities, :comments_library_arts, :course_registration_difficulty, :course_rigor, :recommendation, :academic_life_stereotypes,  :class_discussions, :administration_attitude, :comments_friendship_social_campus, :extracurricular_involvement_ability, :food_quality_on_campus, :residence_halls, :recommended_dorms, :athletic_accessibility, :student_center_unique_features, :overall_social_satisfaction, :social_life_recommendation, :social_life_rumors, :safe_unsafe, :weather, :spirit_pride, :college_nearby_community, :neighboring_community_activities, :financial_value, :overall_satisfaction, :choose_again, :advice,  :name, :cancontact, :email, :class_sizes => [], :social_life => [], :friendship_making => [], :campus_life => [], :activities => [], :why_chose_school => [])
    end
end
