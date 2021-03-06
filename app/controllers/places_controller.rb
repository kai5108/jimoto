class PlacesController < ApplicationController

  def new
    @place = Place.new
    @places = Place.all
  end

  def index
    @place = Place.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    # kaminari
    @places = Kaminari.paginate_array(@place).page(params[:page]).per(6)
    # @places = Place.all.page(params[:page]).per(6)
    @place_all = Place.all
    @user = current_user
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    @user = current_user
    if @place.save
      redirect_to place_path(@place)
    else
      render "new"
    end
  end

  def show
    @place = Place.find(params[:id])
    @place_comment = PlaceComment.new
    @place_comments = @place.place_comments.page(params[:page]).per(10)
    @user = current_user
  end


  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to place_path
    else
      render "edit"
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_path
  end

  private
  def place_params
    params.require(:place).permit(:name, :image, :address, :capitan, :latitude, :longitude)
  end
end
