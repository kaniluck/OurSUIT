class HomesController < ApplicationController

  def top
    @randams = Post.order("RANDOM()").limit(20)
  end

  def search
  end

  def index
    posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(9)
  end

end
