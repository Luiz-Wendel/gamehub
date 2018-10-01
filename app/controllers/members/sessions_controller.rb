class Members::SessionsController < Devise::SessionsController
  protected
    def after_sign_in_path_for(resource)
      stored_location = stored_location_for(resource)
      
      stored_location # Redireciona para a página armazenda
      #site_profile_dashboard_index_path
    end
end
