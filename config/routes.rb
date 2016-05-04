Rails.application.routes.draw do
  

 # devise_for :users, 
  #           :controllers => {
   #            :sessions => 'users/sessions',
    #           :registrations => 'users/registrations'
     #        }

  devise_for :users, 
             :controllers => {
                               :sessions => 'api/sessions', 
                               :registrations => 'api/registrations'
                             }

  resources :users

  devise_scope :user do
    get "api/all", to: "api/registrations#index"
    #get "login", to: "api/sessions#new"
    #get "logout", to: "devise/sessions#destroy"
    authenticated :user do
      root :to => 'home#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'api/sessions#new', as: :unauthenticated_root
    end


   # match '/users/all' => 'users/registrations#index', :via => :get
        #match '/sessions' => 'sessions#destroy', :via => :delete
    
  end

  post "users/save" =>"users#create"



#    devise_for :tin_usuarios
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  #root to: "users/sessions#new"


  #get  'users/index'
  #get  'home/username'

 # resources :home do
  #    member do
   #     get 'admin'
    #    get 'username'
    #  end
#  end

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
