class Order < ActiveRecord::Base
	belongs_to :restaurant
    has_many :ordered_items 

    accepts_nested_attributes_for :ordered_items, :reject_if => lambda { |ordered_item| ordered_item[:id].blank? }

	validates_presence_of :waiter_name
	validates_presence_of :restaurant_id
	validates_presence_of :ipad_id
	# validates_presence_of :pin
	# validates_uniqueness_of :pin
	
	# validates :party_size { only_integer: true }

	scope :alphabetically, order('waiter_name')

end	
