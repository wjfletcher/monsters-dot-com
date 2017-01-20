class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # update_attrs = [:password, :password_confirmation, :current_password, :email]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
