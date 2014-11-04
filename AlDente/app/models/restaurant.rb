class Restaurant < ActiveRecord::Base

	has_many :items
	has_many :sessions
	has_many :customers
    
    validates :name, presence: true
	
	scope :alphabetically, order('name')

end
