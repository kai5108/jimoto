class LikesController < ApplicationController
  def index
    @place = Place.all
    @places = Place.page(params[:page]).per(6)
  end
  
  def create
    @place = Place.find(params[:place_id])
    like = current_user.likes.new(place_id: @place.id)
    like.save
    # redirect_to place_path(@place)
  end
  
  def destroy
    @place = Place.find(params[:place_id])
    like = current_user.likes.find_by(place_id: @place.id)
    like.destroy
    # redirect_to place_path(@place)
  end
  
end
