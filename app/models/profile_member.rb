class ProfileMember < ActiveRecord::Base
  belongs_to :member
  
  # Validations
  validates_presence_of :name, :username
end
