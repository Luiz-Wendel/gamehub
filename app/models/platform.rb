class Platform < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :games
  
  # Validations
  validates_presence_of :name
end
