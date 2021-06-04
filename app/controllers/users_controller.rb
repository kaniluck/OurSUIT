class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  # ユーザー詳細ページ表示の為
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    rand = Rails.env.production? ? "rand()" : "RANDOM()"
    @randams = User.order(rand).limit(7)
  end

  # プロフィール編集ページ表示の為
  def edit
  end

  # プロフィール更新の為
  def update
    if @user.update(user_params)
      redirect_to user_path(@user), success: "ユーザー情報を更新しました！"
    else
      flash.now[:warning] = '必須項目を入力してください。'
      render "edit"
    end
  end

  # フォローしているユーザーの投稿タイムライン表示の為
  def time_line
    @posts_all = Post.all
    @user = User.find(current_user.id)
    @followings_users = @user.followings
    @posts = @posts_all.where(user_id: @followings_users).order("created_at DESC").page(params[:page]).per(9)
  end

  private

  def user_params
    params.require(:user).permit(:name, :intro, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
