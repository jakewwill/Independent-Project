class RankingsController < ApplicationController
  def index
  end

  def new
      @ranking = Ranking.new
  end
  
  def create
      @ranking = Ranking.new(ranking_params)
      if @ranking.save
        flash[:success] = "Ranking successfully submitted"
        redirect_to root_path
      else
        flash[:danger] = "Error submitting ranking"
      end
  end

  def show
      @ranking = Ranking.find(params[:id])
  end
  
private
    def ranking_params
      params.require(:ranking).permit(:name, :response1, :response2, :response3)
    end
end
