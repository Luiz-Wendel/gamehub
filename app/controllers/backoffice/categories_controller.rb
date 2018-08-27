class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: [:edit, :update] # Seta a categoria para as ações 'edit' e 'update'

  def index
  	@categories = Category.all
  end

  def new
    @category = Category.new # Cria uma categoria vazia para que possa ser acessada através de um form
  end

  def create
    @category = CategoryService.create(params_category) # Cria uma nova categoria com o parâmetro da descrição

    unless @category.errors.any?
      redirect_to backoffice_categories_path,
        notice: "A categoria (#{@category.description}) foi incluída com sucesso!" # Redireciona enviando uma mensagem de sucesso
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(params_category)
      redirect_to backoffice_categories_path,
        notice: "A categoria foi alterada para (#{@category.description}) com sucesso!" # Redireciona enviando uma mensagem de alteração
    else
      render :edit
    end
  end

  private

    def params_category
      params.require(:category).permit(:description)
    end

    def set_category
      @category = Category.find(params[:id])
    end

end
