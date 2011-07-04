class Event < ActiveRecord::Base
	acts_as_gmappable
	
	def gmaps4rails_address
		self.address
	end
	
	def gmaps4rails_infowindow
		"
		<h4>#{self.name} - #{self.startdate} to #{self.enddate}</h4>
		<p>#{self.description}</p><p>#{self.id}</p>
		"
    	end

	def gmaps4rails_title
      		"#{self.name}: #{self.startdate} to #{self.enddate}"
    	end

	attr_accessible :name, :address, :description, :startdate, :enddate, :latitude, :longitude, :gmaps

	belongs_to :user
	
	#Many to many relation
	has_many :relationships
	has_many :subscriptions, :through => :relationships, :source => :user


	validates :name, :presence => true, :length => { :maximum => 140 }
	validates :address, :presence => true, :length => { :maximum => 8000 }
	validates :description, :presence => true, :length => { :maximum => 8000 }
 	validates :user_id, :presence => true
 	validates :startdate, :presence => true
 	validates :enddate, :presence => true

	default_scope :order => 'events.created_at DESC'
end
