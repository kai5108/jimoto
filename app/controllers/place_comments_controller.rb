class PlaceCommentsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @comment = current_user.place_comments.build(place_comment_params)
    @comment.place_id = @place.id
    @comment.save
      redirect_to request.referer
    @place_comment = PlaceComment.new
  end
  
  def destroy
    @place = Place.find(params[:place_id])
    @place_comment = PlaceComment.find(params[:id]).destroy
    @place_comment.destroy
      redirect_to request.referer
  end
  
  private
  def place_comment_params
    params.require(:place_comment).permit(:comment)
  end
end
