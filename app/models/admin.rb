class Admin < ActiveRecord::Base
  # Enums
  enum role: {:full => 0, :restricted => 1}

  # Scopes
  scope :with_full_access, -> { where(role: 0) } # Mesma coisa que definir um método
  scope :with_restricted_access, -> { where(role: 1) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # Validations
  validates_presence_of :role, :name

end
