class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    # サインアップ後のリダイレクト先を Devise のユーザー登録ページに設定
    new_user_registration_path
  end
end
