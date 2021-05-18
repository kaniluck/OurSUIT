class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @randams = User.order("RANDOM()").limit(8)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), success: "ユーザー情報を更新しました！"
    else
      flash.now[:warning] = '必須項目を入力してください。'
      render "edit"
    end
  end

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
