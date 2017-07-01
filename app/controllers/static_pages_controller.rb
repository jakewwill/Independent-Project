class StaticPagesController < ApplicationController
  before_action :enough_rankings, only: [:college_rankings]
  
  def home
    @reviews = Review.order(id: :asc);
    @most_reviewed_colleges = College.order(reviews_count: :desc)
  end
  
  def college_rankings
    @colleges = College.order(response1_average: :desc);
    @counter = 1;
  end
  
  def find_colleges
  end
  
  def most_reviews
    @colleges = College.order(reviews_count: :desc).paginate(page: params[:page], per_page: 15, :total_entries => 30)
  end
  
  def my_colleges
    respond_to do |format|
      format.html
      format.json { @colleges = College.search(params[:term]) }
    end
  end
  
  def login
  end
  
  private
    def enough_rankings
      @rankings = Ranking.all
      if (@rankings.count < 10)
        redirect_to(root_url)
        flash[:danger] = "There are not enough rankings yet to view this page"
      end
    end
end
