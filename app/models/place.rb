class Place < ApplicationRecord
  # アソシエーション
  belongs_to :user 
  has_many :place_comments, dependent: :destroy
  attachment :image
  
  # バリデーション
  validates :name, presence: true, length:{maximum: 50} #場所名
  validates :capitan, presence: true, length:{minimum: 5,maximum: 300} #場所説明
  validates :address, presence: true #住所
  validates :image, presence: true
end
