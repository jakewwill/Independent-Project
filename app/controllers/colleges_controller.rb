class CollegesController < ApplicationController
  def index
    @colleges = College.order('name ASC').paginate(page: params[:page], per_page: 40)
    if params[:search]
      @colleges = College.search(params[:search]).order("name ASC").paginate(page: params[:page], per_page: 40)
    else
      @colleges = College.order('name ASC').paginate(page: params[:page], per_page: 40)
    end
  end

  def new
  end

  def create
    @college = College.new(college_params)
    if @college.save
      flash[:success] = "College created successfully!"
      redirect_to @college
    else
      render 'new'
    end
  end

  def show
    @college = College.find(params[:id])
    @reviews = Review.all.paginate(page: params[:page], per_page: 10)
    @rankings = Ranking.all.paginate(page: params[:page], per_page: 10)
    # Create an array with all the reviews for this college
    Review.all.each do |r|
      if (r.college_name != @college.name)
        @reviews = @reviews - [r]
      end
    end
    
    # Create an array with all the rankings for this college
    Ranking.all.each do |r|
      if (r.college_name != @college.name)
        @rankings = @rankings - [r]
      end
    end
    
  end

  def import
    College.import(params[:file])
    redirect_to root_url, notice: "Data imported!"
  end

  private

    def college_params
      params.require(:college).permit(:name)
    end
end
