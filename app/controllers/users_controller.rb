class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @places = @user.places.all
  end
  
  def edit
    @user = User.find(params[:id])
    if @user = current_user
      redirect_to user_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      flash[:notice] ='User was successfully created.'
      redirect_to user_path(user.id)
    else
      render "edit"
    end
  end
  
  private
  def users_params
    params.require(:users).permit(:name, :email, :capitan, :image)
  end
end
