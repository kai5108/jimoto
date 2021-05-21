require 'rails_helper'

describe 'ユーザーログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
    
    context 'ヘッダーと表示内容のテスト' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'タイトルが表示される' do
        expect(page).to have_content 'jimoto'
      end
      it 'Sign upリンクが表示される　一番左' do
        sign_up_link = find_all('a')[1].native.inner_text
        expect(sign_up_link).to match(/sign up/i)
      end
      it 'Sign upリンクの内容が正しい' do
        sign_up_link = find_all('a')[1].native.inner_text
        expect(page).to have_link sign_up_link, href: new_user_registration_path
      end
       it 'Log inリンクが表示される　左から２番目' do
        log_in_link = find_all('a')[2].native.inner_text
        expect(log_in_link).to match(/log in/i)
      end
      it 'Log inリンクの内容が正しい' do
        log_in_link = find_all('a')[1].native.inner_text
        expect(page).to have_link log_in_link, href: new_user_session_path
      end
       it 'Placeリンクが表示される　左から３番目' do
        place_link = find_all('a')[3].native.inner_text
        expect(place_link).to match(/place/i)
      end
      it 'Placeリンクの内容が正しい' do
        place_link = find_all('a')[1].native.inner_text
        expect(page).to have_link place_link, href: places_path
      end
    end
  end
  # describe ''
end