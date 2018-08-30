class Category < ActiveRecord::Base
  validates_presence_of :description

  # Scopes
  scope :order_by_description, -> { order(:description) } # Pega todas a categorias ordenadas de forma ascendente conforme a descrição
end
