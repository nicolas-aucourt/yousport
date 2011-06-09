class MobileSessionsController < ApplicationController

   def new
    	@title = "Sign in"
	@meta_title = "Meta title of Sign in"
	@meta_desc = "Meta description of Sign in"
	@h1 = "Sign in"
  end

  def create
	user = User.authenticate(params[:mobile_session][:email],params[:mobile_session][:password])
    	if user.nil?
      		render :text => 'false'
    	else
      		sign_in user
      		render :text => cookies[:remember_token]
    	end
  end

end
