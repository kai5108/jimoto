class PlacesController < ApplicationController
  
  def index
    @place = Place.all
  end
  
  def show
    @place = Place.find(params[:id])
  end
  
  def new
    @places = Place.new
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
  
  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to place_path(@place)
    else
      render "new"
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
    params.require(:place).permit(:name, :image_id, :address, :capitan, :user_id)
  end
end
