class ApplicationController < ActionController::Base
  protect_from_forgery  
  filter_parameter_logging "pass"
  
  def current_user
		if !session[:user_id].present?
			@current_user = nil
		else
  		@current_user ||= User.find(session[:user_id])
  	end
	end
end
