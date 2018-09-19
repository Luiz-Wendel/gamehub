class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  # Validates
  validates :title, :description, :category, :finish_date, :picture, presence: true
  validates :price, numericality: { greater_than: 0 }

  # Scope
  scope :descending_order, ->(quantity = 10) { limit(quantity).order(created_at: :desc) } # Pega cinco anúnicos ordenados de forma descendente conforme a data de criação
  scope :to_member, ->(member) { where(member: member) } # Pega os anúncios de um membro

  # Configuração da gem 'paperclip'
  has_attached_file :picture, styles: { large: "800,300#", medium: "254x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # Configuração da gem 'money-rails'
  monetize :price_cents

end
