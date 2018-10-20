class Site::Profile::SalesController < Site::ProfileController
  # Before Actions
  before_action :set_sales, only: [:edit, :update, :destroy, :detail]
  
  def index
    @sales = Sale.to_member(current_member)
  end
  
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(params_sale)
    @sale.member = current_member

    if @sale.save
      redirect_to site_profile_sales_path, notice: "Venda adicionada com sucesso!"
    else
      render :new
    end
  end
  
  def edit
    #
  end
  
  def update
    if @sale.update(params_sale)
      redirect_to site_profile_sales_path, notice: "Venda atualizada com sucesso!"
    else
      render :edit
    end
  end
  
  def destroy
    if @sale.destroy
      redirect_to site_profile_sales_path,
        notice: "Venda excluída com sucesso!"
    else
      render :index
    end
  end
  
  private

    def set_sales
      @sale = Sale.find(params[:id])
    end

    def params_sale
      params.require(:sale).permit(:member_game_id, :price)
    end
end
