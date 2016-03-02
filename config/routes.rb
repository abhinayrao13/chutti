Rails.application.routes.draw do
  root 'welcome#index'
  get 'users/sign_up' => redirect('users/sign_in')
  devise_for :users, controllers: {
        registrations: 'registrations/registrations'
  }
  resources :dashboard
  resources :leaves
  resources :notices
  resources :roles

  get "/leaves/:id/leave_status_accept" => "leaves#leave_status_accept"
  get "/leaves/:id/leave_status_decline" => "leaves#leave_status_decline"

  get "/list_users" => "list_users#index"
  get "/list_users/new" => "list_users#new"
  get "/list_users/:id/edit" => "list_users#edit"
  post "/list_users" => "list_users#create"
  put "/list_users/:id" => "list_users#update"
  delete "/list_users/:id" => "list_users#delete"

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
