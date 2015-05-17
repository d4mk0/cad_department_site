class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from SecurityError do |exception|
    redirect_to root_url
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :find_side_ads

  def authenticate_admin_user!
    raise SecurityError unless current_user.try(:admin?)
  end

  def after_sign_in_path_for(user)
    user.admin? ? admin_dashboard_path : root_path 
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def find_side_ads
    @side_ads = Ad.for_front.limit(2)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :patronymic]
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :patronymic]
  end
end
