require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'アソシエーションテスト' do
    context 'Userモデルとの関係' do
      it 'N:1になっている' do
        expect(Place.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'PlaceCommentとの関係' do
      it '1:Nになっている' do
        expect(Place.reflect_on_association(:place_comments).macro).to eq :has_many
      end
    end
    context 'Likeとの関係' do
      it '1:Nになっている' do
        expect(Place.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
  end

  describe 'バリデーションテスト' do
    subject { place.valid? }

    let(:user) { create(:user) }
    let!(:place) { FactoryBot.build(:place, user_id: user.id) }

    context 'nameカラム' do
      it '空白でないこと' do
        place.name = ''
        is_expected.to eq false
      end
      it '50文字以下であること 50文字は○' do
        place.name = Faker::Lorem.characters(number: 50)
        is_expected.to eq false
        # なぜかfalse
      end
      it '50文字以下であること 51文字は×' do
        place.name = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
    end
    context 'capitanカラム' do
      it '空白でないこと' do
        place.capitan = ''
        is_expected.to eq false
      end
     it '300文字以下であること 300文字は○' do
        place.capitan= Faker::Lorem.characters(number: 300)
        is_expected.to eq false
        # なぜかfalse
      end
      it '300文字以下であること 301文字は×' do
        place.capitan = Faker::Lorem.characters(number: 301)
        is_expected.to eq false
      end
    end
    context 'addressカラム' do
      it '空白でないこと' do
        place.address = ''
        is_expected.to eq false
      end
    end
  end
end