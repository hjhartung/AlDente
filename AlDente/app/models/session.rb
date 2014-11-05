class Session < ActiveRecord::Base
	belongs_to :restaurant
    has_many :customers

	validates_presence_of :waiter_name
	# validates_presence_of :ipad_id
	validates_presence_of :restaurant_id
	
	scope :alphabetically, order('waiter_name')
end
