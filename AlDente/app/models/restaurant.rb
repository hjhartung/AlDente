class Restaurant < ActiveRecord::Base

	has_many :items
	has_many :sessions
	has_many :customers,
    
	validates_presence_of :name
	
	scope :alphabetically, order('name')

end
