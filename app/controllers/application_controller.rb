class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :super_user?

  def require_user
    redirect_to sign_in_path unless current_user
  end

  def current_user
    Employee.find(session[:emp_id]) if session[:emp_id]
  end

  def super_user?
    current_user.admin? if current_user
  end

  def require_super_user
    unless current_user.admin?
      redirect_to welcome_path
      flash[:danger] = "You are not authorised to do that."
    end
  end
end
