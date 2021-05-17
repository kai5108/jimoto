class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
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
  # フォロー
  def follow
    @user = User.find(params[:user_id])
    render "follow"
  end
  # フォロワー
  def follower
    @user = User.find(params[:user_id])
    render "follower"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :capitan, :image)
  end
end
