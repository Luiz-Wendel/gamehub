class Site::Profile::ExchangesController < Site::ProfileController
  # Before Actions
  before_action :set_exchanges, only: [:edit, :update, :destroy, :detail]
  
  def index
    @exchanges = Exchange.to_member(current_member)
  end
  
  def new
    @exchange = Exchange.new
  end

  def create
    @exchange = Exchange.new(params_exchange)
    @exchange.member = current_member

    if @exchange.save
      redirect_to site_profile_exchanges_path, notice: "Troca adicionada com sucesso!"
    else
      render :new
    end
  end
  
  def edit
    #
  end
  
  def update
    if @exchange.update(params_exchange)
      redirect_to site_profile_exchanges_path, notice: "Troca atualizada com sucesso!"
    else
      render :edit
    end
  end
  
  def destroy
    if @exchange.destroy
      redirect_to site_profile_exchanges_path,
        notice: "Troca excluída com sucesso!"
    else
      render :index
    end
  end
  
  private

    def set_exchanges
      @exchange = Exchange.find(params[:id])
    end

    def params_exchange
      params.require(:exchange).permit(:member_game_id, :game_id, :price)
    end
end
