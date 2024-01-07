class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:office_id])
  end

  def after_sign_in_path_for(resource)
    # サインイン後のリダイレクト先を Devise のユーザー登録ページに設定
    new_user_registration_path
  end
end
