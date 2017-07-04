class UsersController < ApplicationController
  before_action :admin_user, only: [:index]
  before_action :correct_user, only: [:destroy]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to PunaLink!"
      log_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :alumni)
    end

    # Confirms a logged-in user.
    def logged_in_user
      if !logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def admin_user
      if (current_user == nil || !current_user.admin?)
        redirect_to(root_url)
        flash[:danger] = "You must be an admin to view this page!"
      end
    end
end
