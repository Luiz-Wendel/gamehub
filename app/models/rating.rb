class Rating < ActiveRecord::Base
  # Associations
  belongs_to :member
  belongs_to :game
  
  # Validations
  validates_numericality_of :rate_val, :in => 1..5
  
  # Scopes
  scope :to_member, ->(member) { where(member: member) }
  scope :where_game, ->(game) { where(game: game) }
  scope :val, ->() { select(:rate_val) }
  
end
