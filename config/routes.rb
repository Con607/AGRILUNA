Myapp::Application.routes.draw do
  devise_for :users
  get 'reports/index'

  get 'reports/quick_general_status'

  resources :unit_conversions
  resources :unit_types
  resources :unit_types
  resources :selections
  resources :selections
  resources :selections
  resources :product_varieties
  resources :product_presentations
  resources :product_qualities
  resources :selection_items
  resources :sales
  resources :selections
  resources :sale_items
  resources :sale_items
  resources :selections
  resources :sales
  resources :selection_items
  resources :products
  resources :product_qualities
  resources :product_presentations
  resources :product_varieties
  resources :harvests
  resources :products
  resources :products
  resources :weathers
  resources :environments
  resources :environmental_conditions
  resources :phenological_stages
  resources :leachates
  resources :product_application_buys
  resources :product_application_buys
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
