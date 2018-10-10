class Backoffice::ClassificationsController < BackofficeController
  # Before Actions
  before_action :set_classification, only: [:edit, :update, :destroy]
  before_action :save_classification_rating, only: [:update, :destroy]
  
  # Variáveis
  @@saved_classification_rating = ""
  
  def index
    @classifications = Classification.all
  end
  
  def new
    @classification = Classification.new
  end

  def create
    @classification = Classification.create(params_classification)

    unless @classification.errors.any?
      redirect_to backoffice_classifications_path,
        notice: "A classificação indicativa (#{@classification.rating_system}) foi incluída com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @classification.update(params_classification)
      redirect_to backoffice_classifications_path,
        notice: "A classificação indicativa (#{@@saved_classification_rating}) foi alterada para (#{@classification.rating_system})!"
    else
      render :edit
    end
  end

  def destroy
    if @classification.destroy
      redirect_to backoffice_classifications_path,
        notice: "A classificação indicativa (#{@@saved_classification_rating}) foi excluída com sucesso!"
    else
      render :index
    end
  end

  private
  
    def save_classification_rating
      @@saved_classification_rating = @classification.rating_system
    end
    
    def params_classification
      params.require(:classification).permit(:rating_system)
    end

    def set_classification
      @classification = Classification.find(params[:id])
    end
    
end
