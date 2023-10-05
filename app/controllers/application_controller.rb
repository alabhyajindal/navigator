class ApplicationController < ActionController::Base
  def require_signin
    unless session[:user_id]
      redirect_to signin_url, alert: 'Please sign in first!'
    end
  end

  def current_user
    User.find(session[:user_id])
  end

  helper_method :current_user
end
