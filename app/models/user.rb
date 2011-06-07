# == Schema Information
# Schema version: 20110607142739
#
# Table name: users
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	attr_accessible :email

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, :presence => true,
                    	  :format   => { :with => email_regex },
                    	  :uniqueness => { :case_sensitive => false }

end
