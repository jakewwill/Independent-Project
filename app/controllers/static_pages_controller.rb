class StaticPagesController < ApplicationController
  def home
    @reviews = Review.order(id: :asc);
  end
  
  def college_rankings
  end
  
  def find_colleges
  end
  
  def most_reviews
    @colleges = College.order(reviews_count: :desc);
  end
  
  def my_colleges
  end
  
  def login
  end
end
