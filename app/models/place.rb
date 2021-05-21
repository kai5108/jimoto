class Place < ApplicationRecord
  # アソシエーション
  belongs_to :user 
  has_many :place_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # いいねに基づいた表示順
  has_many :liked_users, through: :likes, source: :user
  attachment :image
  
  # バリデーション
  validates :name, presence: true, length:{maximum: 50} #場所名
  validates :capitan, presence: true, length:{minimum: 5,maximum: 300} #場所説明
  validates :address, presence: true #住所
  validates :image, presence: true

  #いいね機能
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
