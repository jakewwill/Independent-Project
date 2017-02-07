class UsersController < ApplicationController
  def index
    
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to PunaLink!"
      log_in @user
      redirect_to user_url(@user)
    else
      render 'new'
    end
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
    
    def correct_user
      @user = User.find(params[:id])
      if (@user != current_user)
        redirect_to(root_url)
        flash[:danger] = "You need to login as the correct user"
      end
    end
end
