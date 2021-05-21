# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "postコントローラーのテスト", type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  describe 'ログイン済み' do
    before do
      sign_in user
    end
    context "ランキングページが正しく表示される" do
      before do
        get posts_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("ランキング")
      end
    end

    context "投稿詳細ページが正しく表示される" do
      before do
        get post_path(post)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "いいね一覧ページが正しく表示される" do
      before do
        get likes_index_post_path(user)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("いいね一覧")
      end
    end

  end
  describe '非ログイン' do
    context "ランキングページへ遷移されない" do
      before do
        get posts_path
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end

    context "投稿詳細ページへ遷移されない" do
      before do
        get post_path(post)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end

    context "いいね一覧ページへ遷移されない" do
      before do
        get likes_index_post_path(user)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end
end