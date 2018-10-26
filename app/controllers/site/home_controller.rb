class Site::HomeController < SiteController
  def index
    @ads = Ad.descending_order(params[:page]) # Chama o scope 'descending_order' do model 'ad.rb'
    @carousel = Ad.random(3) # Chama o scope 'random' do model 'ad.rb'
    @platforms = Platform.order_by_name
    @exchanges = Exchange.descending_order(params[:exchanges_page])
    @sales = Sale.descending_order(params[:sales_page])
  end
end
