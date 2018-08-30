class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  # Configuração da gem 'money-rails'
  monetize :price_cents

  validates_presence_of :title
end
