class Site::Profile::MemberGamesController < Site::ProfileController
  # Before Actions
  before_action :set_member_games, only: [:edit, :update, :destroy, :detail]
  before_action :save_game_name, only: [:destroy]
  
  # Variáveis
  @@saved_game_name = ""

  def index
    @member_games = MemberGame.to_member(current_member)
    @last_platform = ""
    @is_fisrt = 0
  end

  def edit
    #
  end

  def update
    if @member_game.update(params_member_game)
      redirect_to site_profile_member_games_path, notice: "Jogo (#{@member_game.game.name}) atualizado com sucesso!"
    else
      render :edit
    end
  end

  def new
    @member_game = MemberGame.new
  end

  def create
    @member_game = MemberGame.new(params_member_game)
    @member_game.member = current_member

    if @member_game.save
      redirect_to site_profile_member_games_path, notice: "Jogo (#{@member_game.game.name}) adicionado com sucesso!"
    else
      render :new
    end
  end
  
  def destroy
    if @member_game.destroy
      redirect_to site_profile_member_games_path,
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
      @@saved_game_name = @member_game.game.name
    end

    def set_member_games
      @member_game = MemberGame.find(params[:id])
    end

    def params_member_game
      params.require(:member_game).permit(:quality, :game_id, :platform)
    end
end
