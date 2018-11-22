Rails.application.routes.draw do

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :send_mail, only: [:edit, :create]
    resources :admins, except: [:show]
    resources :diagrams, only: [:index]
    resources :genres, except: [:show]
    resources :platforms, except: [:show]
    resources :classifications, except: [:show]
    resources :games, except: [:show]
    
    get 'games/details/:id', to: 'games#detail', as: 'game_detail'

    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home', to: 'home#index'
    get 'search' , to: 'search#trades'

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :profile_member, only: [:edit, :update]
      resources :member_games, except: [:show]
      resources :exchanges, except: [:show]
      resources :sales, except: [:show]
      resources :offers, only: [:create, :destroy, :update]
      
      get 'member_games/details/:id', to: 'member_games#detail', as: 'member_game_detail'
      get 'offers/recieved/', to: 'offers#recieved', as: 'offers_recieved'
      get 'offers/performed/', to: 'offers#performed', as: 'offers_performed'
      get 'offers/details/:id', to: 'offers#detail', as: 'offers_detail'
    end

    resources :exchange_detail, only: [:show]
    resources :sale_detail, only: [:show]
    resources :comments, only: [:create]
    resources :platforms, only: [:show]
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :members, controllers: { 
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }

  root 'site/home#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
