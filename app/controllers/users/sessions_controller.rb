class Users::SessionsController < Devise::SessionsController
  # ゲストユーザーの為のコントローラー
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), success: 'ゲストユーザーとしてログインしました。'
  end

end