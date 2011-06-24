class Event < ActiveRecord::Base
	attr_accessible :name, :description

	belongs_to :user
	
	#Many to many relation
	has_many :subscriptions
	has_many :users, :through => :subscriptions


	validates :name, :presence => true, :length => { :maximum => 140 }
	validates :description, :presence => true, :length => { :maximum => 8000 }
 	validates :user_id, :presence => true

	default_scope :order => 'events.created_at DESC'
end
