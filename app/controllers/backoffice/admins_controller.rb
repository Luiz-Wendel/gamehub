class Backoffice::AdminsController < BackofficeController
  # Before Actions
  before_action :set_admin, only: [:edit, :update, :destroy] # Seta a categoria para as ações 'edit' e 'update'

  # After Actions
  after_action :verify_authorized, only: :new # Verifica se foi autorizado (caso alguém apague ou comente a linha de autorização na definição)
  after_action :verify_policy_scoped, only: :index # Verifica se o escopo foi utilizado

  def index
    @admins = policy_scope(Admin) # Verifica, através do escopo do Pundit, quais Administradores devem ser mostrados
  end

  def new
    @admin = Admin.new # Cria um administrador vazio para que possa ser acessado através de um form
    authorize @admin # Autorizar a criação para Administradores via Pundit
  end

  def create
    @admin = Admin.new(params_admin) # Cria um novo administrador com o parâmetro
    if @admin.save
      redirect_to backoffice_admins_path,
        notice: "O Administrador (#{@admin.email}) foi incluído com sucesso!" # Redireciona enviando uma mensagem de sucesso
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @admin.update(params_admin)
      redirect_to backoffice_admins_path,
        notice: "O perfil do Administrador (#{@admin.name}) foi alterado com sucesso!" # Redireciona enviando uma mensagem de alteração
    else
      render :edit
    end
  end

  def destroy
    admin_name = @admin.name

    if @admin.destroy
      redirect_to backoffice_admins_path,
        notice: "O Administrador (#{admin_name}) foi excluído com sucesso!" # Redireciona enviando uma mensagem de alteração
    else
      render :index
    end
  end

  private

    def params_admin
    passwd = params[:admin][:password] # Pega a senha do administrador
    passwd_conf = params[:admin][:password_confirmation]

    if passwd.blank? && passwd_conf.blank? # Verifica se estão vindo do formulário em branco
      params[:admin].except!(:password, :password_confirmation) # Ignora as senhas para poder atualizar o email do administrador
    end

      params.require(:admin).permit(:name, :email, :password, :password_confirmation) # Libera os parâmetros
    end

    def set_admin
      @admin = Admin.find(params[:id])
    end

end
