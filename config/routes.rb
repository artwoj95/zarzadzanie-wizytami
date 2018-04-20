Rails.application.routes.draw do


  match 'appointments/new_date' => 'appointments#new_date', :via => :get
  get 'customers/employee/:employee_id' => 'customers#employee', as: :customer_employee

  resources :secretaries do
    get 'appointments'
    get 'calendar'
    get 'expired_date'
  end
  resources :appointments do
    get 'accept'
  end
  resources :employees do
    get 'appointments', as: :appointment
    resources :appointments
    resources :working_hours
    get 'calendar'
  end
  resources :customers do
    get 'calendar'
    get 'search'
  end

  namespace :customers do
    resources :employee, only: :show
  end

  devise_for :users 
  root 'home#index'

  namespace :admin do
    resources :users do
      get 'user_list'
      get 'change_user_type',  as: :change_type
      get 'become'
    end
  end

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
