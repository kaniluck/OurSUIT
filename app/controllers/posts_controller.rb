class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_ids].split(',')
    if  @post.save
      @post.save_tags(tag_list)
      redirect_to post_path(@post), success: "投稿を作成しました！"
    else
      redirect_to user_path(current_user), warning: "写真とタイトルは必須です。"
    end
  end

  def index
    posts = Post.includes(:users).sort {|a,b| b.users.size <=> a.users.size}
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(9)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user), danger: "投稿を削除しました。"
  end

  def likes_index
    @user = User.find(params[:id])
    @posts = Kaminari.paginate_array(@user.like_posts).page(params[:page]).per(9)
  end

   private

  def post_params
    params.require(:post).permit(:title, :image, :text)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to root_path
    end
  end

end
