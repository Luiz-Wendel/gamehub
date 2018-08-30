class Site::HomeController < ApplicationController
	layout "site"

  def index
  	@categories = Category.order(:description) # Pega todas a categorias ordenadas de forma ascendente conforme a descrição
    @ads = Ad.limit(5).order(created_at: :desc) # Pega cinco anúnicos ordenados de forma descendente conforme a data de criação
  end
end
