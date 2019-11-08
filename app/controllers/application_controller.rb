class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_sign_up_parameters, if: :devise_controller?

  protected

  def production?
    Rails.env.production?
  end

  def configure_sign_up_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :encrypted_password, :nickname, :first_name, :last_name, :first_kana, :last_kana, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

