class BackofficeController < ApplicationController
	before_action :authenticate_admin!

  # Set layout
	layout "backoffice"

  #Definir o Usuário do Pundit
  def pundit_user
    current_admin # current_user
  end
end
