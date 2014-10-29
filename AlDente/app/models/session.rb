class Session < ActiveRecord::Base
	belongs_to :restaurant
    has_many :ordered_items #is this necessary since its an optional relationship

	validates_presence_of :waiter_name
	validates_presence_of :ipad_id
	validates_presence_of :restaurant_id
	validates_presence_of :user_id
	validates_presence_of :PIN
	validates_presence_of :party_size
	validates :party_size { only_integer: true }

	scope :alphabetically, order('waiter_name')


	def createpin (length = 6)
		chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ123456789'
  		p = ''
  		length.times { p << chars[rand(chars.size)] }
  		p
	end
end	
