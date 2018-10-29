class Site::HomeController < SiteController
  def index
    @platforms = Platform.order_by_name
    @all_exchanges = Exchange.descending_order(params[:exchanges_page])
    @all_sales = Sale.descending_order(params[:sales_page])
    @exchanges_count = Exchange.count
    @sales_count = Sale.count
  end
end
