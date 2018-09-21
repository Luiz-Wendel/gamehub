class Site::CategoriesController < SiteController
  def show
    @categories = Category.order_by_description # Chama o scope 'order_by_description' do model 'category.rb'
    @category = Category.friendly.find(params[:id])
    @ads = Ad.by_category(@category) # Chama o scope 'by_category' do model 'ad.rb'
  end
end
