class OrderedItem < ActiveRecord::Base

	#relationships
	belongs_to :item_split
	belongs_to :customer
end
