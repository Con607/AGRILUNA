Myapp::Application.routes.draw do

  resources :events
  resources :receipes
  resources :apportionment_per_greenhouses
  resources :user_roles
  resources :permissions
  resources :roles
  resources :role_permissions
  resources :user_companies
  resources :cycles
  resources :companies
  get 'reports/index'

  get 'reports/quick_general_status'

  resources :unit_conversions
  resources :unit_types
  resources :selections
  resources :product_varieties
  resources :product_presentations
  resources :product_qualities
  resources :selection_items
  resources :sales
  resources :sale_items
  resources :products
  resources :harvests
  resources :weathers
  resources :environments
  resources :environmental_conditions
  resources :phenological_stages
  resources :leachates
  resources :suppliers
  resources :product_application_buys
  resources :administration_costs
  resources :operating_costs
  resources :fertigations
  resources :fertigation_items
  resources :application_products
  resources :application_items
  resources :applications
  resources :application_processes
  resources :greenhouse_employees

  resources :pay_roll_items do
    put :update_discount
    put :update_bonus
  end

  resources :pay_rolls

  resources :assistances

  resources :job_positions

  resources :greenhouses

  resources :employees

  get "home/index"
  get "home/minor"

  devise_for :users

  devise_scope :user do 
    get "users_list" => "manage_users#index"
    get "edit_user" => "manage_users#edit_user"
    get "new_user" => "manage_users#new_user"
    post "create_user" => "manage_users#create_user"
    post "update_user" => "manage_users#update_user"
    get "show_user" => "manage_users#show_user"
  end

  #get "users_list", to: "users/registrations#index"



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
root to: 'home#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # 
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
  #     #   end
end
