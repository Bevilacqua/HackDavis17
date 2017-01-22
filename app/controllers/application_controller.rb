class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  # current_user
  # ============
  def current_user
    @current_user ||= User.find_by(id: cookies[:user_id]) if cookies[:user_id]
  end

  # authoize
  # ========
  def authorize
    redirect_to login_path(subdomain: false) unless current_user
  end
end
