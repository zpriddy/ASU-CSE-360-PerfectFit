PerfectFit::Application.routes.draw do
  resources :healths

  get "password_resets/new"
  resources :activities

  resources :profiles

  #get "sessions/new"
  #resources :users

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'



   
  resources :users
  resources :sessions
  resources :password_resets
  match '/home',    to: 'static_pages#home',    via: 'get'
  match 'home_page', to: 'users#home_page', via: 'get'
  match '/dashboard',    to: 'users#dashboard',    via: 'get'
  match '/change_password', to: 'users#change_email_password', via: 'get'
  match '/change_email', to: 'users#change_email_password', via: 'get'
  match '/edit_profile', to: 'profiles#edit_profile', via: 'get'
  match '/show_profile', to: 'profiles#show_profile', via: 'get'
  match '/set_profile', to: 'users#set_profile', via: 'get'
  match '/log_activity', to: 'activities#log_activity', via: 'get'
  root to: 'users#home_page'
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
