class ItemSplit < ActiveRecord::Base

	#relationships
	belongs_to :items
	has_many :item_splits
end
