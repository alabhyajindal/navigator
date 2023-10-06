class ApplicationController < ActionController::Base
  private
  
  def require_signin
    unless current_user
      redirect_to signin_url, alert: 'Unauthorized'
    end
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
