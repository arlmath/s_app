class UsersController < ApplicationController
  
  def index
    
  end
  def new
    @user=User.new
  end
  def show
    @user=User.find(params[:id])
  end
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      log_in @user
      remember user
      redirect_to @user
    else
      flash[:danger] = "Invalid Details"
      render 'new'
    end
  end
  private

    def user_params
      p params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
