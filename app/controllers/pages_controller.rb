class PagesController < ApplicationController
  def home
	@title="Home"
	@meta_title="Meta title of the Home"
	@meta_desc="Meta description of the Home"
	@h1="YouSport helps to share information with your proximity depending on your sport's interests."
	@pageurl=request.fullpath    
	@event = Event.new if signed_in?
  end

  def yourevents
	@title="Your events"
	@meta_title="Meta title of the Events"
	@meta_desc="Meta description of the Events"
	@h1="Your events"
	if signed_in?	
		@event = Event.new
		@events = current_user.events.paginate(:page => params[:page], :per_page => 10) 
	end
  end

  def yoursubscriptions
	@title="Your subscriptions"
	@meta_title="Meta title of the Subscriptions"
	@meta_desc="Meta description of the Subscriptions"
	@h1="Your subscriptions"
  end

  def contact
	@title="Contact"
	@meta_title="Meta title of the Contact"
	@meta_desc="Meta description of the Contact"
	@h1="Contact us"
  end

  def about
	@title="About"
	@meta_title="Meta title of the About"
	@meta_desc="Meta description of the About"
	@h1="About us"
  end

  def help
	@title="Help"
	@meta_title="Meta title of the Help"
	@meta_desc="Meta description of the Help"
	@h1="Help"
  end

end
