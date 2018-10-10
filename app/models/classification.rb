class Classification < ActiveRecord::Base
  # Associations
  has_many :games
  
  # Validations
  validates_presence_of :rating_system
end
