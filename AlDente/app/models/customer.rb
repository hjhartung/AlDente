class Customer < ActiveRecord::Base
  attr_accessible :name, :paid, :session_id, :tip_percentage
  
  # Relationships
  belongs_to :sessions
  has_many :item_splits
  
  # Scopes
  scope :alphabetical, order(:name)
  scope :for_session, lambda {|session_id| where ("session_id = ?", session_id) }

  # scope :by_location, order('location')
  # scope :for_tournament, lambda {|tournament_id| where("tournament_id = ?", tournament_id) }
  
  # Validations
  validates :name, :session_id, presence: true
  validates :session_id { only_integer: true }
  validates :paid, numericality: { :greater_than_or_equal_to => 0 }
  validates :tip_percentage, numericality: { :greater_than_or_equal_to => 0 }

  # Methods  

end
