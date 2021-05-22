require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { FactoryBot.create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    subject { test_post.valid? }
    let(:test_post) { post }

    context 'titleカラム' do
      it '空欄でないこと' do
        test_post.title = ''
        is_expected.to eq false;
      end
    end
    context 'imageカラム' do
      it '空欄でないこと' do
        test_post.image = ''
        is_expected.to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end

    context 'likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
  end
end