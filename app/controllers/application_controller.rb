class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def require_admin
    redirect_to root_url unless current_user.admin?
  end
  
  def require_president
    redirect_to root_url unless current_user.president?
  end
  
  def require_treas
    redirect_to root_url unless current_user.treasurer?
  end
  
  def require_secretary
    redirect_to root_url unless current_user.secretary?
  end
  
  
end
