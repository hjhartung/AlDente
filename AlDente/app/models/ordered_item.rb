class OrderedItem < ActiveRecord::Base

	#relationships
	belongs_to :order

	#validations
	validates_presence_of :order_id
	validates :order_id, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
	validates_presence_of :item_id
	validates :item_id, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }

	#scope
	#scope :by_order where('order_id = ?', :order_id)
end
