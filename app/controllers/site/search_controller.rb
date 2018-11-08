class Site::SearchController < SiteController
  def trades
    @platforms = Platform.order_by_name
    @offerings = Exchange.search_offering(params[:q], params[:offerings_page])
    @wantings = Exchange.search_wanting(params[:q], params[:wantings_page])
    @sales = Sale.search(params[:q], params[:sales_page])
    @all_offerings = Exchange.all_offering(params[:q])
    @all_wantings = Exchange.all_wanting(params[:q])
    @all_exchanges = Exchange.all
    @all_sales = Sale.all
    @exchanges_count = Exchange.count
    @sales_count = Sale.count
  end
end
