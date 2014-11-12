class OrderedItem < ActiveRecord::Base

	#relationships
	belongs_to :session

	#validations
	validates_presence_of :session_id
	validates :session_id, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
	validates_presence_of :item_id
	validates :item_id, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }

	#scope
	scope :by_session where('session_id = ?', :session_id)
end
