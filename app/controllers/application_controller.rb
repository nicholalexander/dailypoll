class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user
  
  def authorize_user
    redirect_to login_url, alert: "not authorized!" if current_user.nil?
  end

  def current_admin_user
    @current_admin_user ||= Administrator.find(session[:admin_id]) if session[:admin_id]
  end

  helper_method :current_admin_user

  def authorize_admin
    redirect_to root_url, alert: "You are not an Admin" if current_admin_user.nil?
  end

    
end
