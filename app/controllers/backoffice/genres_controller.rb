class Backoffice::GenresController < BackofficeController
  # Before Actions
  before_action :set_genre, only: [:edit, :update, :destroy] # Seta o gênero para as ações 'edit', 'update' e 'destroy'
  before_action :save_genre_desc, only: [:update, :destroy] # Salva a desc do gênero para as ações 'update' e 'destroy'
  
  # Variáveis
  @@saved_genre_desc = ""
  
  def index
    @genres = Genre.all
  end
  
  def new
    @genre = Genre.new # Cria um gênero vazio para que possa ser acessado através de um form
  end

  def create
    @genre = Genre.create(params_genre) # Cria um novo gênero com o parâmetro da descrição

    unless @genre.errors.any?
      redirect_to backoffice_genres_path,
        notice: "O gênero (#{@genre.description}) foi incluído com sucesso!" # Redireciona enviando uma mensagem de sucesso
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @genre.update(params_genre)
      redirect_to backoffice_genres_path,
        notice: "O gênero (#{@@saved_genre_desc}) foi alterado para (#{@genre.description})!" # Redireciona enviando uma mensagem de alteração
    else
      render :edit
    end
  end

  def destroy
    if @genre.destroy
      redirect_to backoffice_genres_path,
        notice: "O gênero (#{@@saved_genre_desc}) foi excluído com sucesso!" # Redireciona enviando uma mensagem de alteração
    else
      render :index
    end
  end

  private
  
    def save_genre_desc
      @@saved_genre_desc = @genre.description
    end
    
    def params_genre
      params.require(:genre).permit(:description)
    end

    def set_genre
      @genre = Genre.find(params[:id])
    end
    
end
