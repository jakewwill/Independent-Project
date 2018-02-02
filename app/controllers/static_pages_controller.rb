class StaticPagesController < ApplicationController
  def home
    @reviews = Review.order('college_name DESC')
    @reviews = @reviews.paginate(:page => params[:page], :per_page => 15)
  end
  
  def most_reviews
    @colleges = College.order(reviews_count: :desc).paginate(page: params[:page], per_page: 15, :total_entries => 45)
  end
end
