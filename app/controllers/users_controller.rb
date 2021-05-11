class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = current_user
    @places= @user.places.all
  end

  def edit
    @user = User.find(params[:id])
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ='User was successfully created.'
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :capitan, :image)
  end
end
