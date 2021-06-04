class Users::RegistrationsController < Devise::RegistrationsController
  # ゲストユーザーの為のコントローラー
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to edit_user_registration_path, danger: 'ゲストユーザーの更新・削除はできません。'
    end
  end

end