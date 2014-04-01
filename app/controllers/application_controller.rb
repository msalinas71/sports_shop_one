class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

def need_authenticate
    unless current_user
      redirect_to new_session_url, alert: 'You need to sign in or sign up before continuing.'
    end
end

def not_need_authenticate
		if current_user
		  redirect_to root_url, notice: 'You are already logged'
		end
	end
end






