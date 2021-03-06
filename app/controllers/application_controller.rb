class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :set_parents
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_sign_up_parameters, if: :devise_controller?

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  
  
  
  protected

  def production?
    Rails.env.production?
  end

  def configure_sign_up_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :encrypted_password, :nickname, :first_name, :last_name, :first_kana, :last_kana, :birthday, :birthyear, :birthmonth])
  end 

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

