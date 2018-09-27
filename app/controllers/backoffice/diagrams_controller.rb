class Backoffice::DiagramsController < BackofficeController
  def index
    %x(bundle exec erd --filename='public/diagram') # Executa o comando bundle exec erd para criar um arquivo chamado 'diagram.pdf' na pasta ./public
  end
end
