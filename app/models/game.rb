class Game < ActiveRecord::Base
  # Associations
  belongs_to :genre
  belongs_to :classification
  belongs_to :platform
  has_many :user_game
  
  # Validates
  validates_presence_of :name, :description, :genre, :classification, :platform , :picture
  
  # Configuração da gem 'paperclip'
  has_attached_file :picture, styles: { large: "900x350#", medium: "254x150#", thumb: "80x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
