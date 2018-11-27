class Site::Profile::RatingsController < Site::ProfileController
  # Before Actions
  before_action :set_rating, only: [:edit, :update, :destroy]
  before_action :save_rating_game_name, only: [:destroy]
  
  # Variáveis
  @@saved_rating_game_name = ""
  
  def index
    @games = Game.all
    @member_rate = Array.new
    @overall_rate = Array.new
    @rating_id = Array.new
    
    @games.each do |game|
      
      @member_rating = Rating.all.to_member(current_member).where_game(game.id)
      
      if @member_rating.blank?
        @member_rate.push(0)
        @rating_id.push('#')
      else
        @member_rating.each do |rating|
          @member_rate.push(rating.rate_val)
          @rating_id.push(rating.id)
        end
      end
      
      @ratings = Rating.all.where_game(game.id)
      
      if @ratings.blank?
        @overall_rate.push(0)
      else
        @temp = 0
        @contador = 0
        @ratings.each.with_index(1) do |rating, i|
          @temp += rating.rate_val
          @contador = i
        end

        @overall = @temp.fdiv(@contador) # .fdiv para especificar que é uma divisão de float (para retornar valor com casas decimais)
        
        @overall_rate.push(@overall)
        
      end
      
    end
  end
  
  def new
    @rating = Rating.new
    @game_id = params[:game_id]
  end

  def create
    @rating = Rating.new(params_rating)
    @rating.member = current_member

    if @rating.save
      redirect_to site_profile_ratings_path, notice: "Avaliação para o Jogo (#{@rating.game.name}) adicionada com sucesso!"
    else
      render :new
    end
  end
  
  def edit
    #
  end

  def update
    if @rating.update(params_rating)
      redirect_to site_profile_ratings_path, notice: "Avaliação para o jogo (#{@rating.game.name}) atualizada com sucesso!"
    else
      render :edit
    end
  end
  
  def destroy
    if @rating.destroy
      redirect_to site_profile_ratings_path,
        notice: "A avaliação do jogo (#{@@saved_rating_game_name}) foi excluído com sucesso!"
    else
      render :index
    end
  end

  private
  
    def save_rating_game_name
      @@saved_rating_game_name = @rating.game.name
    end

    def set_rating
      @rating = Rating.find(params[:id])
    end

    def params_rating
      params.require(:rating).permit(:game_id, :rate_val, :comment)
    end
end
