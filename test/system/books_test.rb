# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:readable_code)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: '良いコード／悪いコードで学ぶ設計入門'
    fill_in '著者', with: 'ミノ駆動'
    fill_in 'メモ', with: '保守しやすい　成長し続けるコードの書き方'

    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text '良いコード／悪いコードで学ぶ設計入門'
    assert_text 'ミノ駆動'
    assert_text '保守しやすい　成長し続けるコードの書き方'
  end

  test 'updating a Book' do
    visit books_url
    within(:table) do
      click_on '編集', match: :first
    end

    fill_in 'メモ', with: @book.memo
    fill_in 'タイトル', with: @book.title
    click_on '更新'

    assert_text '本が更新されました。'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
