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
        flash[:success] = "Ranking successfully submitted. It is awaiting evaluation by a college counselor"
        
        user = current_user
        user.update_attribute(:submitted_ranking, 1)
        
        redirect_to root_path
      else
        flash[:danger] = "Error submitting ranking"
      end
  end

  def show
      @ranking = Ranking.find(params[:id])
  end
  
  def destroy
    @ranking = Ranking.find(params[:id])

    @user = User.find_by(name: @ranking.name)
    @user.update_attribute(:submitted_ranking, false);
    
    @college = College.find_by(name: @ranking.college_name)
    @college.update_attribute(:rankings_count, @college.rankings_count - 1)

    # Really ugly way to do this, but I can't think of a better way at the moment
    @college.update_attributes(response1_average: (@college.response1_average * (@college.rankings_count + 1) - @ranking.response1.to_f)/@college.rankings_count || 0,
                               response2_average: (@college.response2_average * (@college.rankings_count + 1) - @ranking.response2.to_f)/@college.rankings_count || 0,
                               response3_average: (@college.response3_average * (@college.rankings_count + 1) - @ranking.response3.to_f)/@college.rankings_count || 0,
                               response4_average: (@college.response4_average * (@college.rankings_count + 1) - @ranking.response4.to_f)/@college.rankings_count || 0,
                               response5_average: (@college.response5_average * (@college.rankings_count + 1) - @ranking.response5.to_f)/@college.rankings_count || 0,
                               response6_average: (@college.response6_average * (@college.rankings_count + 1) - @ranking.response6.to_f)/@college.rankings_count || 0,
                               response7_average: (@college.response7_average * (@college.rankings_count + 1) - @ranking.response7.to_f)/@college.rankings_count || 0,
                               response8_average: (@college.response8_average * (@college.rankings_count + 1) - @ranking.response8.to_f)/@college.rankings_count || 0,
                               response9_average: (@college.response9_average * (@college.rankings_count + 1) - @ranking.response9.to_f)/@college.rankings_count || 0
                               )

    @ranking.destroy
    flash[:success] = "Ranking deleted"
    redirect_to rankings_path
  end
  
  def verify
    r = Ranking.find(params[:id])
    r.update_attribute(:verified, true)

    college = College.find_by(name: r.college_name)
    college.update_attribute(:rankings_count, college.rankings_count + 1)

    # Really ugly way to do this, but I can't think of a better way at the moment
    college.update_attributes(response1_average: (college.response1_average * (college.rankings_count - 1) + r.response1.to_f)/college.rankings_count,
                              response2_average: (college.response2_average * (college.rankings_count - 1) + r.response2.to_f)/college.rankings_count,
                              response3_average: (college.response3_average * (college.rankings_count - 1) + r.response3.to_f)/college.rankings_count,
                              response4_average: (college.response4_average * (college.rankings_count - 1) + r.response4.to_f)/college.rankings_count,
                              response5_average: (college.response5_average * (college.rankings_count - 1) + r.response5.to_f)/college.rankings_count,
                              response6_average: (college.response6_average * (college.rankings_count - 1) + r.response6.to_f)/college.rankings_count,
                              response7_average: (college.response7_average * (college.rankings_count - 1) + r.response7.to_f)/college.rankings_count,
                              response8_average: (college.response8_average * (college.rankings_count - 1) + r.response8.to_f)/college.rankings_count,
                              response9_average: (college.response9_average * (college.rankings_count - 1) + r.response9.to_f)/college.rankings_count
                              )
    
    redirect_to rankings_path
    flash[:success] = "Ranking Verified!"
  end
  
private
    def ranking_params
      params.require(:ranking).permit(:name, :college_name, :response1 || '', :ranking1_explanation || '', :response2 || '', :ranking2_explanation || '', :response3 || '', :ranking3_explanation || '', :response4 || '', :ranking4_explanation || '', :response5 || '', :ranking5_explanation || '', :response6 || '', :ranking6_explanation || '', :response7 || '', :ranking7_explanation || '', :response8 || '', :ranking8_explanation || '', :response9 || '', :ranking9_explanation || '')
    end
end
