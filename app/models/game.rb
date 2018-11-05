class Game < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :genres
  belongs_to :classification
  has_and_belongs_to_many :platforms
  has_many :member_games, dependent: :destroy
  
  # Validates
  validates_presence_of :name, :description, :genres, :classification, :platforms , :picture
  
  # Configuração da gem 'paperclip'
  has_attached_file :picture, styles: { medium: "200x250#", thumb: "96x120#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
