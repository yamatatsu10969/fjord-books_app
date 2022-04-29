# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:first_day)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Rails によるアプリケーション開発'
    fill_in '内容', with: '少しずつ理解が進んできた'

    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'Rails によるアプリケーション開発'
    assert_text '少しずつ理解が進んできた'
  end

  test 'updating a Report' do
    visit reports_url
    within(:table) do
      click_on '編集', match: :first
    end

    fill_in '内容', with: @report.content
    fill_in 'タイトル', with: @report.title
    click_on '更新'

    assert_text '日報が更新されました。'
    assert_text @report.content
    assert_text @report.title
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
