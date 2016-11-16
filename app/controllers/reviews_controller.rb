class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:new]
  before_action :alumni_user, only: [:new]
  
  def index
  end
  
  def new
    @review = Review.new
  end
  
  def create
      @review = Review.new(review_params)
      if @review.save
        flash[:success] = "Review successfully submitted"
        redirect_to root_path
      else
        flash[:danger] = "Error submitting review, please ensure you answered every question"
      end
  end
  
  def show
    @review = Review.find(params[:id])
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
