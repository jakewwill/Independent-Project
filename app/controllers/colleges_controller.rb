class CollegesController < ApplicationController
  def index
  end

  def new
  end

  def show_all_colleges
    @colleges = College.all
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