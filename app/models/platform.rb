class Platform < ActiveRecord::Base
  # Associations
  has_many :games
  
  # Validations
  validates_presence_of :name
end
