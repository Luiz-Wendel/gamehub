class Backoffice::AdminsController < BackofficeController
  # Before Actions
  before_action :set_admin, only: [:edit, :update, :destroy] # Seta a categoria para as ações 'edit' e 'update'

  # After Actions
  after_action :verify_authorized, only: [:new, :destroy] # Verifica se foi autorizado (caso alguém apague ou comente a linha de autorização na definição)
  after_action :verify_policy_scoped, only: :index # Verifica se o escopo foi utilizado

  # Variáveis
  @@saved_admin_name

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
    save_admin_name
    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin, @@saved_admin_name).deliver_now # Manda um email para o administrador que teve seus dados alterados
      redirect_to backoffice_admins_path,
        notice: "O perfil do Administrador (#{@admin.name}) foi alterado com sucesso!" # Redireciona enviando uma mensagem de alteração
    else
      render :edit
    end
  end

  def destroy
    authorize @admin
    save_admin_name

    if @admin.destroy
      redirect_to backoffice_admins_path,
        notice: "O Administrador (#{@@saved_admin_name}) foi excluído com sucesso!" # Redireciona enviando uma mensagem de alteração
    else
      render :index
    end
  end

  private

    def save_admin_name
      @@saved_admin_name = @admin.name
    end

    def params_admin
      if password_blank?
        params[:admin].except!(:password, :password_confirmation) # Ignora as senhas para poder atualizar o email do administrador
      end

      params.require(:admin).permit(policy(@admin).permitted_attributes) # Libera os parâmetros conforme o tipo de adm definidos na 'admin_policy.rb'
    end

    def password_blank? # Verifica se as senhas estão vindo vazias do formulário
      params[:admin][:password].blank? &&
      params[:admin][:password_confirmation].blank?
    end

    def set_admin
      @admin = Admin.find(params[:id])
    end

end
