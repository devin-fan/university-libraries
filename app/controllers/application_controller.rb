class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in?
    current_user
  end
  helper_method :logged_in?

  def check_login
    redirect_to login_url, alert: "You need to log in to view this page." if current_user.nil?
  end
  
  def can_view? (f)
    f.permission==0 or (logged_in? and current_user.role? :admin) or (logged_in? and current_user.role? :student and f.permission==1) or (logged_in? and f.user_id==current_user.id)
  end
  helper_method :can_view?
   
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Please log in to access the application."
    puts exception
    redirect_to login_url
  end
  
end
