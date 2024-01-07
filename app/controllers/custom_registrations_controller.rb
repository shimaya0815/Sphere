class CustomRegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    flash[:notice] = "あなたの事業所ID: #{resource.office_id}"
    super
  end
end
