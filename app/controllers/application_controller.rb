class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # default: redirect to login page if not signed in
  before_action :authenticate_user!

  # Add in a 'Username' parameter to Devise
  #before_action :configure_permitted_parameters, if: :devise_controller?

  # How to handle various errors
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def handle_error
    redirect_to root_url
  end

end
