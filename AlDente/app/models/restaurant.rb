class Restaurant < ActiveRecord::Base

	has_many :items
	has_many :orders
	has_many :customers
	has_many :users
    
	validates_presence_of :name
	
	scope :alphabetically, order('name')

end
