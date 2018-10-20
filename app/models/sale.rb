class Sale < ActiveRecord::Base
  belongs_to :member
  belongs_to :member_game
  
  # Validates
  validates_presence_of :member_game
  validates :price, numericality: { greater_than: 0 }
  
  #Scopes
  scope :to_member, ->(member) { where(member: member) }
  
  # Configuração da gem 'money-rails'
  monetize :price_cents
  
end
