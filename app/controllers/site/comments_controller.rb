class Site::CommentsController < SiteController
  # Autenticação
  before_action :authenticate_member!
  
  def create
    @comment = Comment.new(comment_params)
    @comment.member = current_member
    
    if @comment.save
      if(@comment.exchange.present?)
        redirect_to site_exchange_detail_path(@comment.exchange.id),
        notice: "Comentário adicionado com sucesso!"
      else
        if(@comment.sale.present?)
          redirect_to site_sale_detail_path(@comment.sale.id),
          notice: "Comentário adicionado com sucesso!"
        end
      end
    else
      if(@comment.exchange.present?)
        redirect_to site_exchange_detail_path(@comment.ad.id),
        notice: "Erro ao adicionar o comentário!"
      else
        if(@comment.sale.present?)
          redirect_to site_sale_detail_path(@comment.ad.id),
          notice: "Erro ao adicionar o comentário!"
        end
      end
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :exchange_id, :sale_id)
  end
end
