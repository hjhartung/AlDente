class User < ActiveRecord::Base
	belongs_to :restaurant
	has_secure_password

	validates_presence_of :restaurant_id
	validates_uniqueness_of :restaurant_id
	validates_inclusion_of :role, :in => %w[admin member], :message => "is not recognized by the system"

  def self.authenticate(restaurant_id, password)
    user = User.find_by_restaurant_id(restaurant_id).try(:authenticate, password)
    return user
  end

  # def self.authenticate(email, password)
  #   user = find_by_email(email)
  #   if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  #     user
  #   else
  #     nil
  #   end
  # end

  def self.admin?
  	return self.role == 'admin'
  end
end