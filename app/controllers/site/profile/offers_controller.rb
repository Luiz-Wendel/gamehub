class Site::Profile::OffersController < Site::ProfileController
  # Autenticação
  before_action :authenticate_member!
  
  # Before Actions
  before_action :set_offers, only: [:destroy, :update, :detail]
  before_action :set_recieved_offers, only: [:recieved, :detail]

  def detail
    @tipo = params[:tipo]
    # Variáveis definidas através do before_action :set_recieved_offers
    if params[:tipo] == 'exchange'
      @offer = @exchange_offers.find(params[:id])
    end
    if params[:tipo] == 'sale'
      @offer = @sale_offers.find(params[:id])
    end
  end
  
  def update
    if params[:commit].present?
      if params[:commit].downcase == 'aceitar'
        if @offer.update_attribute(:status, 'accepted')
          redirect_to site_profile_offers_recieved_path, notice: "Troca aceita com sucesso!"
        else
          redirect_to site_profile_offers_recieved_path, notice: "Erro ao aceitar a troca!"
        end
      elsif params[:commit].downcase == 'recusar'
        if @offer.update_attribute(:status, 'refused')
          redirect_to site_profile_offers_recieved_path, notice: "Troca recusada com sucesso!"
        else
          redirect_to site_profile_offers_recieved_path, notice: "Erro ao recusar a troca!"
        end
      else
        redirect_to site_profile_offers_recieved_path
      end
    end
  end
  
  def recieved
    # Variáveis definidas através do before_action :set_recieved_offers
  end
  
  def performed
    @exchange_offers = Offer.performed_exchanges(current_member)
    @sale_offers = Offer.performed_sales(current_member)
  end
  
  def create
    @offer = Offer.new(offer_params)
    @offer.member = current_member
    
    if(@offer.exchange.present? && @offer.member_game.present?)
      if @offer.save
        redirect_to site_exchange_detail_path(@offer.exchange.id),
        notice: "Oferta de troca realizada com sucesso!"
      else
        redirect_to site_exchange_detail_path(@offer.ad.id),
        notice: "Erro ao realizar a oferta de troca!"
      end
    end
    
    if(@offer.sale.present?)
      if @offer.save
        redirect_to site_sale_detail_path(@offer.sale.id),
        notice: "Oferta de compra realizada com sucesso!"
      else
        edirect_to site_sale_detail_path(@offer.ad.id),
        notice: "Erro ao realizar a oferta de compra!"
      end
    end
    
  end
  
   def destroy
    if @offer.destroy
      redirect_to site_profile_offers_performed_path,
        notice: "Solicitação excluída com sucesso!"
    else
      redirect_to site_profile_offers_performed_path,
        notice: "Falha ao excluir a solicitação!"
    end
  end
  
  private
  
    def offer_params
      params.require(:offer).permit(:status, :exchange_id, :sale_id, :member_game_id)
    end
    
    def set_offers
      @offer = Offer.find(params[:id])
    end
    
    def set_recieved_offers
      @exchange_offers = Offer.recieved_exchanges(current_member)
      @sale_offers = Offer.recieved_sales(current_member)
    end
end
