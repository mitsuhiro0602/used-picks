class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  # before_action :set_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # ヘッダーにユーザー名の表示
  # def set_user
  #   @user = current_user.nickname
  # end
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
    end
end
