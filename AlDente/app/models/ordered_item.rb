class OrderedItem < ActiveRecord::Base
    #attr_accessible :session_id, :item_id, :comments


	#relationships
	belongs_to :session
	belongs_to :item

	#validations
	validates_presence_of :session_id
	validates :session_id, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
	validates_presence_of :item_id
	validates :item_id, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
end
