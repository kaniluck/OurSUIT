class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success, :info, :warning, :danger

  # ヘッダーにユーザーアイコン表示の為
  before_action :get_current_user
  def get_current_user
    @user_icon = current_user
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
