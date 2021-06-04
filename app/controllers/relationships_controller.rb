class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  # フォローする
  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
  end

  # フォロー外す
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
  end

  # フォロー一覧ページ表示の為
  def followings
     user = User.find(params[:user_id])
     @users = user.followings
  end

  # フォロワー一覧ページ表示の為
  def followers
     user = User.find(params[:user_id])
     @users = user.followers
  end

end
