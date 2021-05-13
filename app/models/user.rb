class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # アソシエーション
  has_many :places, dependent: :destroy
  has_many :place_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  attachment :image
  
  #バリデーション
  validates :name ,presence: true, length:{maximum: 30}
  validates :email ,presence: true, uniqueness: true, format: { with: /\A[\w+-.]+@[a-z\d-]+(.[a-z\d-]+)*.[a-z]+\z/i, message: 'は半角英数字で入力してください' }

end
