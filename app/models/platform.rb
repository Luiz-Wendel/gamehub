class Platform < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :games
  
  # Validations
  validates_presence_of :name
  
  # Scopes
  scope :order_by_name, -> { order(:name) } # Pega todas a plataformas ordenadas de forma ascendente conforme o nome
end
