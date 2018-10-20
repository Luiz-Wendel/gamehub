class MemberGame < ActiveRecord::Base
  # Associations
  belongs_to :game
  belongs_to :member
  
  # Validates
  validates_presence_of :game, :member, :quality, :platform
  
  #Scopes
  scope :to_member, ->(member) { where(member: member).order(:platform).joins(:game).merge(Game.order(:name)) }
  
  def game_name_with_quality
    str = self.game.name
    str += ", Qualidade: " + self.quality.truncate(20)
    str
  end
end
