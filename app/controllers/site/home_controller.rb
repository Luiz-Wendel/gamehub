class Site::HomeController < SiteController
  def index
    @platforms = Platform.order_by_name
    @exchanges = Exchange.descending_order(params[:exchanges_page])
    @sales = Sale.descending_order(params[:sales_page])
    @all_exchanges = Exchange.all
    @all_sales = Sale.all
    @exchanges_count = Exchange.count
    @sales_count = Sale.count
  end
end
