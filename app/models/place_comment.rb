class PlaceComment < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :place
end
