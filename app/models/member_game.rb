class MemberGame < ActiveRecord::Base
  # Associations
  belongs_to :game
  belongs_to :member
  
  # Validates
  validates_presence_of :game, :member
end
