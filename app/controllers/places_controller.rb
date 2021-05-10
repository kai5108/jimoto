class PlacesController < ApplicationController
  
  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    if @place.save
      redirect_to places_path(@place)
    else
      render "new"
    end
  end
  
  def index
    # kaminari
    @places = Place.all
    # page(params[:page]).per(7)
    # @place_all = Place.all
  end
  
  def show
    @place = Place.find(params[:id])
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
    flash[:notice] ='Place was successfully created.'
    redirect_to places_path
  end
  
  private
  def place_params
    params.require(:place).permit(:name, :image, :address, :capitan)
  end
end
