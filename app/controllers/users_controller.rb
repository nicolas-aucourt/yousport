class UsersController < ApplicationController

  def show
	@user = User.find(params[:id])
  end

  def new    
	@title = "Sign up"
	@meta_title="Meta title of the Sign Up"
	@meta_desc="Meta description of the Sign Up"
	@h1="Sign Up"
  end

end
