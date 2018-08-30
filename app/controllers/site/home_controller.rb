class Site::HomeController < SiteController
  def index
  	@categories = Category.order_by_description # Chama o scope 'order_by_description' do model 'category.rb'
    @ads = Ad.last_six # Chama o scope 'last_six' do model 'ad.rb'
  end
end
