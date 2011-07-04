class PagesController < ApplicationController
  def home
	@title="Home"
	@meta_title="Meta title of the Home"
	@meta_desc="Meta description of the Home"
	@h1="YouSport helps to share information with your proximity depending on your sport's interests."
	@pageurl=request.fullpath    
	@events = Event.all.paginate(:page => params[:page], :per_page => 5) if signed_in?
	@json = Event.all.to_gmaps4rails if signed_in?
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
	if signed_in?	
		#current_user.relationships.create!(:event_id => "11")
		#current_user.relationships.find_by_event_id(Event.find("11")).destroy
		@subscriptions = current_user.subscriptions.paginate(:page => params[:page], :per_page => 10) 
 
	end
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

private

    def find_events_by_radius(radius) 
      radius=radius.to_f/1000
      @events=[@user]
      Event.all.each do |i|
        @events.push(i) if computeDistance(@user.longitude,@user.latitude,i.longitude,i.latitude)<radius
      end
    end
  
    def computeDistance(lat1, long1, lat2, long2)
      rho = 3960.0; 
      phi_1 = (90.0 - lat1)*Math::PI/180.0;
      phi_2 = (90.0 - lat2)*Math::PI/180.0;
      theta_1 = long1*Math::PI/180.0;
      theta_2 = long2*Math::PI/180.0;    
      return rho*1.609344*Math::acos( Math.sin(phi_1)*Math::sin(phi_2)*Math::cos(theta_1 - theta_2) + Math::cos(phi_1)*Math::cos(phi_2) )
    end

end
