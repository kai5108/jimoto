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
      it 'タイトルが表示される' do
        expect(page).to have_content "New Place Post"
      end
    #   it '画像のリンクが表示される' do
    #     expect(page).to have_link '', href: place_path(place)
    #   end
    #   it '投稿した場所のリンクが表示される' do
    #     expect(page).to have_link '', href: place_path(place)
    #   end
    #   it '住所が表示される' do
    #     expect(page).to have_content place.address
    #   end
    #   it 'ユーザー名が表示される' do
    #     expect(page). to have_content place.user
    #   end
    #   it 'いいね数が表示される' do
    #     expect(page).to have_content place.likes.count
    #   end
    #   it 'コメント数が表示される' do
    #     expect(page).to have_content place.place_comments
    #   end
    #   it 'paginateが表示される' do
    #     expect(page).to have_content paginate
    #   end
    end
  end
end
describe 'ヘッダーのテスト' do
  before do
      visit root_path
    end
    
  context '表示内容の確認' do
      it 'Sign Upリンクが表示される: 左上から1番目のリンクが「Sign Up」である' do
        signup_link = find_all('a')[1].native.inner_text
        expect(signup_link).to match(/sign up/i)
      end
      it 'Log inリンクが表示される: 左上から2番目のリンクが「Log in」である' do
        login_link = find_all('a')[2].native.inner_text
        expect(login_link).to match(/log in/i)
      end
      it 'Placeリンクが表示される: 左上から3番目のリンクが「Place」である' do
        place_link = find_all('a')[3].native.inner_text
        expect(place_link).to match(/place/i)
      end
      # it 'loginリンクが表示される: 左上から4番目のリンクが「login」である' do
      #   login_link = find_all('a')[4].native.inner_text
      #   expect(login_link).to match(/login/i)
      # end
    end

    context 'リンクの内容を確認' do
      subject { current_path }

      it 'Sign Upを押すと、新規登録画面に遷移する' do
        signup_link = find_all('a')[1].native.inner_text
        signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signup_link
        is_expected.to eq '/users/sign_up'
      end
      it 'Log inを押すと、ログイン画面に遷移する' do
        login_link = find_all('a')[2].native.inner_text
        login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link login_link
        is_expected.to eq '/users/sign_in'
      end
      it 'Placeを押すと、場所一覧画面に遷移する' do
        place_link = find_all('a')[3].native.inner_text
        place_link = place_link.delete(' ')
        place_link.gsub!(/\n/, '')
        click_link place_link
        is_expected.to eq '/places'
      end
    end
end
