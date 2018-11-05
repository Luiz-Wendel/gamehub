class Member < ActiveRecord::Base
  # Associations
  has_many :member_games, dependent: :destroy
  has_many :exchanges, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :games, :through => :member_games
  has_one :profile_member
  accepts_nested_attributes_for :profile_member
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
