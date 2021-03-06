class Site::PlatformsController < SiteController
  def show
    @platforms = Platform.order_by_name
    @platform_name = params[:id]
    @exchanges = Exchange.where_platform(params[:id], params[:exchanges_page])
    @sales = Sale.where_platform(params[:id], params[:sales_page])
    @all_exchanges = Exchange.all
    @all_sales = Sale.all
    @exchanges_count = Exchange.count
    @sales_count = Sale.count
    @exchanges_platform_count = Exchange.quantity_by_platform(params[:id])
    @sales_platform_count = Sale.quantity_by_platform(params[:id])
  end
end
