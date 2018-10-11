class Game < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :genres
  belongs_to :classification
  has_and_belongs_to_many :platforms
  
  # Validates
  validates_presence_of :name, :description, :genres, :classification, :platforms , :picture
  
  # Configuração da gem 'paperclip'
  has_attached_file :picture, styles: { large: "900x350#", medium: "254x150#", thumb: "80x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
