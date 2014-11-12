class User < ActiveRecord::Base
	belongs_to :restaurant
	has_secure_password

	validates_presence_of :restaurant_id
	validates_inclusion_of :role, :in => %w[admin member], :message => "is not recognized by the system"

  def self.authenticate(restaurant_id, password)
    find(restaurant_id).try(:authenticate, password)
  end
end