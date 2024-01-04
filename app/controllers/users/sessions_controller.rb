class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    if resource && resource.office_id == params[:user][:office_id]
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      set_flash_message!(:alert, 'Invalid office ID')
      redirect_to new_user_session_path
    end
  end

  # protected

  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:office_id])
  # end
end
