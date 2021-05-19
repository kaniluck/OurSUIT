class HomesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def top
    rand = Rails.env.production? ? "rand()" : "RANDOM()"
    @randams = Post.order(rand).limit(15)
  end

  def search
  end

  def index
    posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(9)
  end

end
