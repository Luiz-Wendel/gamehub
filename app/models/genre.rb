class Genre < ActiveRecord::Base
  # Gem Friendly Id
  #include FriendlyId
  #friendly_id :description, use: :slugged

  # Associations
  has_and_belongs_to_many :games
  
  # Validations
  validates_presence_of :description
  
  # Scopes
  scope :order_by_description, -> { order(:description) } # Pega todos os gêneros ordenados de forma ascendente conforme a descrição
end
