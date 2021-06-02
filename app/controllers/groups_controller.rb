class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    if Group.create(group_params)
      redirect_to place_group_path
    else
      render :new
    end
  end

  def index
    @groups = Group.all.order(updated_at: :desc)
  end

  def show
    @group = Group.find_by(id: params[:id])

    if !@group.users.include?(current_user)
      @group.users << current_user
    end

    @groupposts = Grouppost.where(group_id: @group.id).all
  end

  private
  def group_params
    params.require(:group).permit(:name, :user_id [])
  end

  def grouppost_params
    params.require(:grouppost).permit(:content)
  end

end
