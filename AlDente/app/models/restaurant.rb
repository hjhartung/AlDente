class Restaurant < ActiveRecord::Base

	# Relationships
	has_many :items
	has_many :orders
	has_many :users

    
	validates_presence_of :name
	
	scope :alphabetically, order('name')

end
