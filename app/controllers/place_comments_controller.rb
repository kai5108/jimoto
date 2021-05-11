class PlaceCommentsController < ApplicationController
  def create
    place = Place.find(params[:place_id])
    comment = current_user.place_comments.new(place_commnet_params)
    comment.place_id = place.id
    comment.save
    redirect_to place_path(place)
  end
  def destroy
  end
  
  private
  def place_comment_params
    params.require(:place_comment).permit(comment)
    
end
