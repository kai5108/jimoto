require 'rails_helper'


describe 'ユーザーログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
    
    let(:user) { create(:user) }
    let!(:other_user) { create(:user) }
    let!(:place) { FactoryBot.build(:place, user_id: user.id) }
    let!(:other_place) { FactoryBot.build(:place, user: other_user) }
    
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq "/"
      end
      it '文章が表示される' do
        expect(page).to find text "ようこそJIMOTOへ!!"
      end
      it 'タイトルが表示される' do
        expect(page).to have_content "New Place Post"
      end
      it '画像のリンクが表示される' do
        expect(page).to have_link '', href: place_path(place)
      end
      it '投稿した場所のリンクが表示される' do
        expect(page).to have_link '', href: place_path(place)
      end
      it '住所が表示される' do
        expect(page).to have_content place.address
      end
      it 'ユーザー名が表示される' do
        expect(page). to have_content place.user
      end
      it 'いいね数が表示される' do
        expect(page).to have_content place.likes.count
      end
      it 'コメント数が表示される' do
        expect(page).to have_content place.place_comments
      end
      it 'paginateが表示される' do
        expect(page).to have_content paginate
      end
    end
  end
end