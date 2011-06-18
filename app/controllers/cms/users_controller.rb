#encoding: utf-8
class Cms::UsersController < ApplicationController
  layout 'admin'
  
  before_filter :have_access
  
  protected
  	def have_access
			if current_user == nil
				redirect_to enter_path
			end
  	end
	
	def update
		@id = params[:user][:id]
		@user = User.find(@id)
		@user.update_attributes(params[:user]) ? render(:update) : redirect_to(:root)
	end
end
