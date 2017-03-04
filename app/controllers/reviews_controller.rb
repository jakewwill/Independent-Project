class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:new]
  before_action :alumni_user, only: [:new]
  
  def index
  end
  
  def new
    if (current_user.submitted_review == 0)
      @review = Review.new
      @colleges = College.all
    else
      flash[:danger] = "Error! You have already submitted a review! You may update it in your profile"
      redirect_to root_path
    end
  end
  
  def create
      @review = Review.new(review_params)
      if @review.save
        flash[:success] = "Review successfully submitted"
        user = current_user
        user.update_attribute(:submitted_review, 1)
        college = College.find_by(name: review_params[:college_name])
        college.update_attribute(:reviews_count, college.reviews_count + 1)
        redirect_to root_path
      else
        flash[:danger] = "Error submitting review, please ensure you answered every question"
      end
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def verify
    r = Review.find(params[:id])
    r.update_attribute(:verified, true)
    redirect_to reviews_path
    flash[:success] = "Review Verified!"
  end
  
  private
    def review_params
      params.require(:review).permit(:name, :question1, :college_name)
    end
    
    def logged_in_user
      if !logged_in?
        flash[:danger] = "You need to login as an alumni to submit a review"
        redirect_to login_url
      end
    end
    
    def alumni_user
      if (@current_user.alumni.eql? "Current Student")
        redirect_to(root_url)
        flash[:danger] = "You need to login as an alumni to submit a review"
      end
    end
end
