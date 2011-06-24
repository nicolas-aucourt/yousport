class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]

  def index
    	@title = "All users"    
	@users = User.paginate(:page => params[:page])
  end

  def show
	@user = User.find(params[:id])
	@events = @user.events.paginate(:page => params[:page], :per_page => 10) 
	@event = Event.new
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

  def edit
    	@title = "Edit user"
	@meta_title="Meta title of the Edit user"
	@meta_desc="Meta description of the Edit user"
	@h1="Edit user"
  end

  def update
    	if @user.update_attributes(params[:user])
      		flash[:success] = "Profile updated."
      		redirect_to @user
    	else
      		@title = "Edit user"
		@meta_title="Meta title of the Edit user"
		@meta_desc="Meta description of the Edit user"
		@h1="Edit user"
      		render 'edit'
    	end
  end

  private

	def correct_user
      		@user = User.find(params[:id])
      		redirect_to(root_path) unless current_user?(@user)
    	end


end
