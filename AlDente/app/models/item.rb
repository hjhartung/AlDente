class Item < ActiveRecord::Base
  attr_accessible :name, :cost, :category, :available, :restaurant_id
  
  # Relationships
  # belongs_to :ordered_items
  # belongs_to :customers
  
  # Scopes



  # scope :for_event, lambda {|event_id| where("event_id = ?", event_id) }
  # scope :for_rank, lambda {|desired_rank| where("min_rank <= ? and (max_rank >= ? or max_rank is null)", desired_rank, desired_rank) }
  # scope :for_age, lambda {|desired_age| where("min_age <= ? and (max_age >= ? or max_age is null)", desired_age, desired_age) }
  # scope :active, where('sections.active = ?', true)
  # scope :inactive, where('sections.active = ?', false)
  # scope :alphabetical, joins(:event).order('events.name, min_rank, min_age')
  # scope :for_location, lambda {|location| where("location LIKE ?", "#{location}%") }
  # scope :by_location, order('location')
  # scope :for_tournament, lambda {|tournament_id| where("tournament_id = ?", tournament_id) }
  
  # Validations



  # validates_numericality_of :min_rank, :only_integer => true, :greater_than => 0
  # validates_numericality_of :max_rank, :only_integer => true, :greater_than_or_equal_to => :min_rank, :allow_blank => true
  # validates_numericality_of :min_age, :only_integer => true, :greater_than_or_equal_to => 5
  # validates_numericality_of :max_age, :only_integer => true, :greater_than_or_equal_to => :min_age, :allow_blank => true
  # validates_numericality_of :event_id, :only_integer => true, :greater_than => 0, :message => "is not a valid event"
  # validates_inclusion_of :active, :in => [true, false], :message => "must be true or false"

  # validate :event_is_active_in_system, :on => :create
  # validate :tournament_is_active_in_system, :on => :create
  # validate :section_is_not_already_in_system, :on => :create
  # validate :min_rank_at_or_above_tourney_minimum
  # validate :max_rank_at_or_below_tourney_maximum

  # Methods  



  
  # def make_inactive
  #   self.active = false
  #   self.save!
  # end
  
  # def make_active
  #   self.active = true
  #   self.save!
  # end

end
