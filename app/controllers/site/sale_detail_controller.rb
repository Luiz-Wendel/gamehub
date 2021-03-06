class Site::SaleDetailController < SiteController
  def show
    @sale = Sale.find(params[:id])
    @all_exchanges = Exchange.all
    @all_sales = Sale.all
    @exchanges_count = Exchange.count
    @sales_count = Sale.count
    @platforms = Platform.order_by_name
  end
end
