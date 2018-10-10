class Backoffice::PlatformsController < BackofficeController
  # Before Actions
  before_action :set_platform, only: [:edit, :update, :destroy] # Seta a plataforma para as ações 'edit', 'update' e 'destroy'
  before_action :save_platform_name, only: [:update, :destroy] # Salva o nome da plataforma para as ações 'update' e 'destroy'
  
  # Variáveis
  @@saved_platform_name = ""
  
  def index
    @platforms = Platform.all
  end
  
  def new
    @platform = Platform.new # Cria uma plataforma vazia para que possa ser acessada através de um form
  end

  def create
    @platform = Platform.create(params_platform) # Cria uma nova plataforma com o parâmetro do nome

    unless @platform.errors.any?
      redirect_to backoffice_platforms_path,
        notice: "A plataforma (#{@platform.name}) foi incluída com sucesso!" # Redireciona enviando uma mensagem de sucesso
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @platform.update(params_platform)
      redirect_to backoffice_platforms_path,
        notice: "A plataforma (#{@@saved_platform_name}) foi alterada para (#{@platform.name})!" # Redireciona enviando uma mensagem de alteração
    else
      render :edit
    end
  end
  
  def destroy
    if @platform.destroy
      redirect_to backoffice_platforms_path,
        notice: "A plataforma (#{@@saved_platform_name}) foi excluída com sucesso!" # Redireciona enviando uma mensagem de alteração
    else
      render :index
    end
  end

  private
  
    def save_platform_name
      @@saved_platform_name = @platform.name
    end

    def params_platform
      params.require(:platform).permit(:name)
    end

    def set_platform
      @platform = Platform.find(params[:id])
    end
    
end
