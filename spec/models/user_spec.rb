require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'アソシエーションテスト' do
    context 'Placeモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:places).macro).to eq :has_many
      end
    end
    context 'PlaceCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:place_comments).macro).to eq :has_many
      end
    end
    context 'Likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
    context 'Relationshipモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:relationships).macro).to eq :has_many
      end
    end
  end
  
  describe 'バリデーションテスト' do
    subject { user.valid? }
    
    let!(:other_user) { create(:user) }
    let(:user) { FactoryBot.create(:user) }

    context 'nameカラム' do
      it '空白でないこと' do
        user.name = ''
        is_expected.to eq false
      end
      it '30文字以下であること 30文字は○' do
        user.name = Faker::Lorem.characters(number: 30)
        is_expected.to eq true
      end
      it '30文字以下であること 31文字は×' do
        user.name = Faker::Lorem.characters(number: 31)
        is_expected.to eq false
      end
    end
  end
end