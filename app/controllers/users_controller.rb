class UsersController < ApplicationController

  def show
	@user = User.find(params[:id])
	@title = @user.email
	@meta_title="Meta title of " + @user.email
	@meta_desc="Meta description of " + @user.email
	@h1= @user.email
  end

  def new    
	@title = "Sign up"
	@meta_title="Meta title of the Sign Up"
	@meta_desc="Meta description of the Sign Up"
	@h1="Sign Up"
	@user = User.new
  end

  def create
	@user = User.new(params[:user])
	if @user.save    
		sign_in @user 
		flash[:success] = "Welcome to YouSport!"
		redirect_to @user
	else
		@title = "Sign up"
		render 'new'
	end
  end

end
