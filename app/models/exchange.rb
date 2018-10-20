class Exchange < ActiveRecord::Base
  belongs_to :member
  belongs_to :member_game
  belongs_to :game
  
  # Validates
  validates_presence_of :game_id, :member_game_id
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  
  #Scopes
  scope :to_member, ->(member) { where(member: member) }
  
  # Configuração da gem 'money-rails'
  monetize :price_cents
  
end
