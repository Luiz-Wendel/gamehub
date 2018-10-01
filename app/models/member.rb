class Member < ActiveRecord::Base
  # Associations
  has_many :ads
  
  # Configuração da gem ratyrate
  ratyrate_rater
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
