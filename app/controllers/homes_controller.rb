class HomesController < ApplicationController
  def top
    # 新着リスト
    @places = Place.limit(4).order(" created_at DESC ")
  end
end
