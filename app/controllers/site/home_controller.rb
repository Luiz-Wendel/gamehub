class Site::HomeController < SiteController
  def index
  	@categories = Category.order_by_description # Chama o scope 'order_by_description' do model 'category.rb'
    @ads = Ad.descending_order(params[:page]) # Chama o scope 'last_six' do model 'ad.rb'
    @carousel = Ad.random(3) # Chama o scope 'random' do model 'ad.rb'
  end
end
