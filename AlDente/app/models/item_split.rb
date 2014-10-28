class ItemSplit < ActiveRecord::Base

	#relationships
	belongs_to :items
	has_many :item_splits

	#validations
	validates_presence_of :item_id
	validates :item_id, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
end
