class HomesController < ApplicationController
  def top
    # 新着リスト
    @places = Place.limit(4).order(" created_at DESC ")
    @place_all = Place.all.page(params[:page]).per(6)
  end
end
