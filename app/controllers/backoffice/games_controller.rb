class Backoffice::GamesController < BackofficeController
   # Before Actions
  before_action :set_game, only: [:edit, :update, :destroy, :detail]
  before_action :save_game_name, only: [:update, :destroy]
  
  # Variáveis
  @@saved_game_name = ""
  
  def index
    @games = Game.all
  end
  
  def new
    @game = Game.new
  end

  def create
    @game = Game.create(params_game)

    unless @game.errors.any?
      redirect_to backoffice_games_path,
        notice: "O jogo (#{@game.name}) foi incluído com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @game.update(params_game)
      redirect_to backoffice_games_path,
        notice: "O jogo (#{@@saved_game_name}) foi alterado!"
    else
      render :edit
    end
  end
  
  def destroy
    if @game.destroy
      redirect_to backoffice_games_path,
        notice: "O jogo (#{@@saved_game_name}) foi excluído com sucesso!"
    else
      render :index
    end
  end
  
  def detail
    #
  end

  private
  
    def save_game_name
      @@saved_game_name = @game.name
    end

    def params_game
      params.require(:game).permit(:picture, :name, :description, :classification_id, :genre_id, :platform_id)
    end

    def set_game
      @game = Game.find(params[:id])
    end
    
end
