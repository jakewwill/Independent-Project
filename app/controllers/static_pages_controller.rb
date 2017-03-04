class StaticPagesController < ApplicationController
  def home
    @reviews = Review.order(id: :asc);
  end
  
  def college_rankings
    @colleges = College.order(response1_average: :desc);
    @counter = 1;
  end
  
  def find_colleges
  end
  
  def most_reviews
    @colleges = College.order(reviews_count: :desc).paginate(page: params[:page], per_page: 15, :total_entries => 120)
  end
  
  def my_colleges
  end
  
  def login
  end
end
