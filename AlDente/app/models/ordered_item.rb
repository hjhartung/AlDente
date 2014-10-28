class OrderedItem < ActiveRecord::Base

	#relationships
	belongs_to :item_split
	belongs_to :customer

	#validations
	validates_presence_of :item_split_id
	validates :item_split_id, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
	validates_presence_of :customer_id
	validates :customer_id, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
end
