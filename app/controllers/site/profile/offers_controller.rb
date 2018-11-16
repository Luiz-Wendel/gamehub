class Site::Profile::OffersController < Site::ProfileController
  # Autenticação
  before_action :authenticate_member!
  
  # Before Actions
  before_action :set_offers, only: [:destroy]
  
  def recieved
    @exchange_offers = Offer.recieved_exchanges(current_member).active
    @sale_offers = Offer.recieved_sales(current_member).active
  end
  
  def performed
    @exchange_offers = Offer.performed_exchanges(current_member).active
    @sale_offers = Offer.performed_sales(current_member).active
  end
  
  def create
    @offer = Offer.new(offer_params)
    @offer.member = current_member
    
    if @offer.save
      if(@offer.exchange.present?)
        redirect_to site_exchange_detail_path(@offer.exchange.id),
        notice: "Oferta realizada com sucesso!"
      else
        if(@offer.sale.present?)
          redirect_to site_sale_detail_path(@offer.sale.id),
          notice: "Oferta realizada com sucesso!"
        end
      end
    else
      if(@offer.exchange.present?)
        redirect_to site_exchange_detail_path(@offer.ad.id),
        notice: "Erro ao realizar a oferta!"
      else
        if(@offer.sale.present?)
          redirect_to site_sale_detail_path(@offer.ad.id),
          notice: "Erro ao realizar a oferta!"
        end
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
    params.require(:offer).permit(:status, :exchange_id, :sale_id)
  end
  
  def set_offers
      @offer = Offer.find(params[:id])
    end
end
