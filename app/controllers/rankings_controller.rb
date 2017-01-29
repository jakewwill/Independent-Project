class RankingsController < ApplicationController
  def index
  end

  def new
      if (current_user.submitted_ranking == 0)
        @ranking = Ranking.new
        @colleges = College.all
      else
        flash[:danger] = "Error! You have already submitted a ranking! You may update it in your profile"
      redirect_to root_path
      end
  end
  
  def create
      @ranking = Ranking.new(ranking_params)
      if @ranking.save
        flash[:success] = "Ranking successfully submitted"
        user = current_user
        user.update_attribute(:submitted_ranking, 1)
        redirect_to root_path
      else
        flash.now[:danger] = "Error submitting ranking"
      end
  end

  def show
      @ranking = Ranking.find(params[:id])
  end
  
private
    def ranking_params
      params.require(:ranking).permit(:name, :college_name, :response1 || '', :response2 || '', :response3 || '', :response4 || '', :response5 || '', :response6 || '', :response7 || '', :response8 || '', :response9 || '', :response10 || '')
    end
end
