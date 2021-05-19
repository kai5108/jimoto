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
end