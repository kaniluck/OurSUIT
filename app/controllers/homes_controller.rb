class HomesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  # トップページの画像スライダーの為
  def top
    rand = Rails.env.production? ? "rand()" : "RANDOM()"
    @randams = Post.order(rand).limit(15)
  end

  # タグ検索ウィンドウ表示の為
  def search
  end

  # タグ検索結果表示の為
  def index
    posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(9)
  end

end
