require 'rails_helper'

RSpec.describe "userコントローラーのテスト", type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  describe 'ログイン済み' do
    before do
      sign_in user
    end
    context "詳細ページが正しく表示される" do
      before do
        get user_path(user)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "プロフィール編集ページが正しく表示される" do
      before do
        get edit_user_path(user)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("プロフィールを編集")
      end
    end

    context "タイムラインページが正しく表示される" do
      before do
        get time_line_user_path(user)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("タイムライン")
      end
    end

  end
  describe '非ログイン' do
    context "詳細ページへ遷移されない" do
      before do
        get user_path(user)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end

    context "プロフィール編集ページへ遷移されない" do
      before do
        get edit_user_path(user)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end

    context "タイムラインページへ遷移されない" do
      before do
        get time_line_user_path(user)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end
end