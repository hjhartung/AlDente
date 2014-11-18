class Restaurant < ActiveRecord::Base

	# Relationships
	has_many :items
	has_many :sessions
    
	validates_presence_of :name
	
	scope :alphabetically, order('name')

end
