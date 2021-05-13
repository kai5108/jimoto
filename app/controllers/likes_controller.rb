class LikesController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    like = current_user.likes.new(place_id :place.id)
    like.save
    redirect_to request.referer
  end
  
  def destroy
    @place = Place.find(params[:place_id])
    like = current_user.likes.new(place_id :place.id)
    like.destory
    redirect_to request.referer
  end
end
