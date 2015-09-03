class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_logged_in?
    session[:user_id].present?
  end
  helper_method :user_logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if user_logged_in?
  end
  helper_method :current_user

  private
    def access_forbidden
      flash[:danger] = "Access forbidden"
      redirect_to root_path
    end

    def require_user
      access_forbidden unless user_logged_in?
    end

    def require_visitor
      redirect_to root_path if user_logged_in?
    end
end
