class ApplicationController < ActionController::Base

  def logged_in?
    if session[:user_id].nil?
      return false
    else
      return true
    end
  end

  def current_user
    if logged_in?
      @current_user ||= User.find(session[:user_id])
    end
  end

  helper_method :current_user, :logged_in?
end
