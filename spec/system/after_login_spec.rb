require 'rails_helper'

describe '[STEP2] ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:place) { FactoryBot.build(:place, user_id: user.id) }
  let!(:other_place) { FactoryBot.build(:place, user: other_user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    context 'リンクの内容を確認' do
      subject { current_path }

      it 'Log outを押すと、自分のユーザ詳細画面に遷移する' do
        logout_link = find_all('a')[1].native.inner_text
        logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link logout_link
        is_expected.to eq '/'
      end
      it 'New postを押すと、Place新規登録画面に遷移する' do
        newpost_link = find_all('a')[2].native.inner_text
        newpost_link = newpost_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link newpost_link
        is_expected.to eq '/places/new'
      end
      it 'My pageを押すと、マイページ画面に遷移する' do
        mypage_link = find_all('a')[3].native.inner_text
        mypage_link = mypage_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        mypage_link.gsub!(/\n/, '')
        click_link mypage_link
        is_expected.to eq '/users/' + user.id.to_s
      end
      it 'Placeを押すと、場所一覧画面に遷移する' do
        place_link = find_all('a')[4].native.inner_text
        place_link = place_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        place_link.gsub!(/\n/, '')
        click_link place_link
        is_expected.to eq '/places'
      end
      it 'Boardを押すと、チャット一覧画面に遷移する' do
        board_link = find_all('a')[5].native.inner_text
        board_link = board_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        board_link.gsub!(/\n/, '')
        click_link board_link
        is_expected.to eq '/chats.2'
      end
    end
  end

  describe 'Place一覧画面のテスト' do
    before do
      visit places_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/places'
      end
      it '「観光地一覧」と表示される' do
        expect(page).to have_content '観光地一覧'
      end
      it 'こちらからを押すと、place新規登録画面へ遷移する' do
        click_link 'こちらから'
        expect(current_path).to eq '/places/new' 
      end
      # it '投稿のタイトルのリンク先がそれぞれ正しい' do
      #   expect(page).to have_link other_place.name, href: place_path(other_place)
      # end
      # it '投稿者のリンク先が正しい' do
      #   expect(page).to have_link place.user.name, href: user_path(place.user)
      #   expect(page).to have_link place.user.name, href: user_path(other_place.user)
      # end
      # it '投稿の住所が表示される' do
      #   expect(page).to have_content other_place.address
      # end
      it '投稿のいいね数が表示される' do
        expect(page).to have_content place.likes.count
        expect(page).to have_content other_place.likes.count
      end
      it 'コメント数が表示される' do
        expect(page).to have_content place.place_comments.count
        expect(page).to have_content other_place.place_comments.count
      end
    end
  end


  #   context 'サイドバーの確認' do
  #     it '自分の名前と紹介文が表示される' do
  #       expect(page).to have_content user.name
  #       expect(page).to have_content user.introduction
  #     end
  #     it '自分のユーザ編集画面へのリンクが存在する' do
  #       expect(page).to have_link '', href: edit_user_path(user)
  #     end
  #     it '「New book」と表示される' do
  #       expect(page).to have_content 'New book'
  #     end
  #     it 'titleフォームが表示される' do
  #       expect(page).to have_field 'book[title]'
  #     end
  #     it 'titleフォームに値が入っていない' do
  #       expect(find_field('book[title]').text).to be_blank
  #     end
  #     it 'opinionフォームが表示される' do
  #       expect(page).to have_field 'book[body]'
  #     end
  #     it 'opinionフォームに値が入っていない' do
  #       expect(find_field('book[body]').text).to be_blank
  #     end
  #     it 'Create Bookボタンが表示される' do
  #       expect(page).to have_button 'Create Book'
  #     end
  #   end

  #   context '投稿成功のテスト' do
  #     before do
  #       fill_in 'book[title]', with: Faker::Lorem.characters(number: 5)
  #       fill_in 'book[body]', with: Faker::Lorem.characters(number: 20)
  #     end

  #     it '自分の新しい投稿が正しく保存される' do
  #       expect { click_button 'Create Book' }.to change(user.books, :count).by(1)
  #     end
  #     it 'リダイレクト先が、保存できた投稿の詳細画面になっている' do
  #       click_button 'Create Book'
  #       expect(current_path).to eq '/books/' + Book.last.id.to_s
  #     end
  #   end
  # end

  # describe '自分の投稿詳細画面のテスト' do
  #   before do
  #     visit book_path(book)
  #   end

  #   context '表示内容の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/books/' + book.id.to_s
  #     end
  #     it '「Book detail」と表示される' do
  #       expect(page).to have_content 'Book detail'
  #     end
  #     it 'ユーザ画像・名前のリンク先が正しい' do
  #       expect(page).to have_link book.user.name, href: user_path(book.user)
  #     end
  #     it '投稿のtitleが表示される' do
  #       expect(page).to have_content book.title
  #     end
  #     it '投稿のopinionが表示される' do
  #       expect(page).to have_content book.body
  #     end
  #     it '投稿の編集リンクが表示される' do
  #       expect(page).to have_link 'Edit', href: edit_book_path(book)
  #     end
  #     it '投稿の削除リンクが表示される' do
  #       expect(page).to have_link 'Destroy', href: book_path(book)
  #     end
  #   end

  #   context 'サイドバーの確認' do
  #     it '自分の名前と紹介文が表示される' do
  #       expect(page).to have_content user.name
  #       expect(page).to have_content user.introduction
  #     end
  #     it '自分のユーザ編集画面へのリンクが存在する' do
  #       expect(page).to have_link '', href: edit_user_path(user)
  #     end
  #     it '「New book」と表示される' do
  #       expect(page).to have_content 'New book'
  #     end
  #     it 'titleフォームが表示される' do
  #       expect(page).to have_field 'book[title]'
  #     end
  #     it 'titleフォームに値が入っていない' do
  #       expect(find_field('book[title]').text).to be_blank
  #     end
  #     it 'opinionフォームが表示される' do
  #       expect(page).to have_field 'book[body]'
  #     end
  #     it 'opinionフォームに値が入っていない' do
  #       expect(find_field('book[body]').text).to be_blank
  #     end
  #     it 'Create Bookボタンが表示される' do
  #       expect(page).to have_button 'Create Book'
  #     end
  #   end

  #   context '投稿成功のテスト' do
  #     before do
  #       fill_in 'book[title]', with: Faker::Lorem.characters(number: 5)
  #       fill_in 'book[body]', with: Faker::Lorem.characters(number: 20)
  #     end

  #     it '自分の新しい投稿が正しく保存される' do
  #       expect { click_button 'Create Book' }.to change(user.books, :count).by(1)
  #     end
  #   end

  #   context '編集リンクのテスト' do
  #     it '編集画面に遷移する' do
  #       click_link 'Edit'
  #       expect(current_path).to eq '/books/' + book.id.to_s + '/edit'
  #     end
  #   end

  #   context '削除リンクのテスト' do
  #     before do
  #       click_link 'Destroy'
  #     end

  #     it '正しく削除される' do
  #       expect(Book.where(id: book.id).count).to eq 0
  #     end
  #     it 'リダイレクト先が、投稿一覧画面になっている' do
  #       expect(current_path).to eq '/books'
  #     end
  #   end
  # end

  # describe '自分の投稿編集画面のテスト' do
  #   before do
  #     visit edit_book_path(book)
  #   end

  #   context '表示の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/books/' + book.id.to_s + '/edit'
  #     end
  #     it '「Editing Book」と表示される' do
  #       expect(page).to have_content 'Editing Book'
  #     end
  #     it 'title編集フォームが表示される' do
  #       expect(page).to have_field 'book[title]', with: book.title
  #     end
  #     it 'opinion編集フォームが表示される' do
  #       expect(page).to have_field 'book[body]', with: book.body
  #     end
  #     it 'Update Bookボタンが表示される' do
  #       expect(page).to have_button 'Update Book'
  #     end
  #     it 'Showリンクが表示される' do
  #       expect(page).to have_link 'Show', href: book_path(book)
  #     end
  #     it 'Backリンクが表示される' do
  #       expect(page).to have_link 'Back', href: books_path
  #     end
  #   end

  #   context '編集成功のテスト' do
  #     before do
  #       @book_old_title = book.title
  #       @book_old_body = book.body
  #       fill_in 'book[title]', with: Faker::Lorem.characters(number: 4)
  #       fill_in 'book[body]', with: Faker::Lorem.characters(number: 19)
  #       click_button 'Update Book'
  #     end

  #     it 'titleが正しく更新される' do
  #       expect(book.reload.title).not_to eq @book_old_title
  #     end
  #     it 'bodyが正しく更新される' do
  #       expect(book.reload.body).not_to eq @book_old_body
  #     end
  #     it 'リダイレクト先が、更新した投稿の詳細画面になっている' do
  #       expect(current_path).to eq '/books/' + book.id.to_s
  #       expect(page).to have_content 'Book detail'
  #     end
  #   end
  # end

  # describe 'ユーザ一覧画面のテスト' do
  #   before do
  #     visit users_path
  #   end

  #   context '表示内容の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/users'
  #     end
  #     it '自分と他人の画像が表示される: fallbackの画像がサイドバーの1つ＋一覧(2人)の2つの計3つ存在する' do
  #       expect(all('img').size).to eq(3)
  #     end
  #     it '自分と他人の名前がそれぞれ表示される' do
  #       expect(page).to have_content user.name
  #       expect(page).to have_content other_user.name
  #     end
  #     it '自分と他人のshowリンクがそれぞれ表示される' do
  #       expect(page).to have_link 'Show', href: user_path(user)
  #       expect(page).to have_link 'Show', href: user_path(other_user)
  #     end
  #   end

  #   context 'サイドバーの確認' do
  #     it '自分の名前と紹介文が表示される' do
  #       expect(page).to have_content user.name
  #       expect(page).to have_content user.introduction
  #     end
  #     it '自分のユーザ編集画面へのリンクが存在する' do
  #       expect(page).to have_link '', href: edit_user_path(user)
  #     end
  #     it '「New book」と表示される' do
  #       expect(page).to have_content 'New book'
  #     end
  #     it 'titleフォームが表示される' do
  #       expect(page).to have_field 'book[title]'
  #     end
  #     it 'titleフォームに値が入っていない' do
  #       expect(find_field('book[title]').text).to be_blank
  #     end
  #     it 'opinionフォームが表示される' do
  #       expect(page).to have_field 'book[body]'
  #     end
  #     it 'opinionフォームに値が入っていない' do
  #       expect(find_field('book[body]').text).to be_blank
  #     end
  #     it 'Create Bookボタンが表示される' do
  #       expect(page).to have_button 'Create Book'
  #     end
  #   end
  # end

  # describe '自分のユーザ詳細画面のテスト' do
  #   before do
  #     visit user_path(user)
  #   end

  #   context '表示の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/users/' + user.id.to_s
  #     end
  #     it '投稿一覧のユーザ画像のリンク先が正しい' do
  #       expect(page).to have_link '', href: user_path(user)
  #     end
  #     it '投稿一覧に自分の投稿のtitleが表示され、リンクが正しい' do
  #       expect(page).to have_link book.title, href: book_path(book)
  #     end
  #     it '投稿一覧に自分の投稿のopinionが表示される' do
  #       expect(page).to have_content book.body
  #     end
  #     it '他人の投稿は表示されない' do
  #       expect(page).not_to have_link '', href: user_path(other_user)
  #       expect(page).not_to have_content other_book.title
  #       expect(page).not_to have_content other_book.body
  #     end
  #   end

  #   context 'サイドバーの確認' do
  #     it '自分の名前と紹介文が表示される' do
  #       expect(page).to have_content user.name
  #       expect(page).to have_content user.introduction
  #     end
  #     it '自分のユーザ編集画面へのリンクが存在する' do
  #       expect(page).to have_link '', href: edit_user_path(user)
  #     end
  #     it '「New book」と表示される' do
  #       expect(page).to have_content 'New book'
  #     end
  #     it 'titleフォームが表示される' do
  #       expect(page).to have_field 'book[title]'
  #     end
  #     it 'titleフォームに値が入っていない' do
  #       expect(find_field('book[title]').text).to be_blank
  #     end
  #     it 'opinionフォームが表示される' do
  #       expect(page).to have_field 'book[body]'
  #     end
  #     it 'opinionフォームに値が入っていない' do
  #       expect(find_field('book[body]').text).to be_blank
  #     end
  #     it 'Create Bookボタンが表示される' do
  #       expect(page).to have_button 'Create Book'
  #     end
  #   end
  # end

  # describe '自分のユーザ情報編集画面のテスト' do
  #   before do
  #     visit edit_user_path(user)
  #   end

  #   context '表示の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/users/' + user.id.to_s + '/edit'
  #     end
  #     it '名前編集フォームに自分の名前が表示される' do
  #       expect(page).to have_field 'user[name]', with: user.name
  #     end
  #     it '画像編集フォームが表示される' do
  #       expect(page).to have_field 'user[profile_image]'
  #     end
  #     it '自己紹介編集フォームに自分の自己紹介文が表示される' do
  #       expect(page).to have_field 'user[introduction]', with: user.introduction
  #     end
  #     it 'Update Userボタンが表示される' do
  #       expect(page).to have_button 'Update User'
  #     end
  #   end

  #   context '更新成功のテスト' do
  #     before do
  #       @user_old_name = user.name
  #       @user_old_intrpduction = user.introduction
  #       fill_in 'user[name]', with: Faker::Lorem.characters(number: 9)
  #       fill_in 'user[introduction]', with: Faker::Lorem.characters(number: 19)
  #       click_button 'Update User'
  #     end

  #     it 'nameが正しく更新される' do
  #       expect(user.reload.name).not_to eq @user_old_name
  #     end
  #     it 'introductionが正しく更新される' do
  #       expect(user.reload.introduction).not_to eq @user_old_intrpduction
  #     end
  #     it 'リダイレクト先が、自分のユーザ詳細画面になっている' do
  #       expect(current_path).to eq '/users/' + user.id.to_s
  #     end
  #   end
  # end
end