Rails.application.routes.draw do
  get 'trainings/new'

  get 'work_structures/new'

  get 'users/index'

  get 'hours' => 'employees#hours'
  post 'hours' => 'employees#hours'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  resources :employees do
    resources :educations
    resources :work_exps
    resources :dependants
    resources :abilities
    resources :employee_abilities
    resources :trainings
    resources :training_employees
    resources :hours
    resources :permissions
  end

  resources :institutions do
    resources :trainings
    resources :instructors
  end

  resources :trainings do
    resources :employees
    resources :training_employees
  end

  resources :training_employees

  resources :work_structures do
    resources :work_structure_abilities
    resources :abilities
  end

  get '/:department/areas' => 'work_structures#dept', as: 'department'

  resources :abilities do
    resources :work_structure_abilities
    resources :work_structures
    resources :employees_abilities
    resources :employees
  end

  resources :users
  get 'test', to: 'employees#test'
  get 'suprimir', to: 'employees#suprimir'
  get 'reactivar', to: 'employees#reactivar'
  get 'comparacion', to: 'employees#comparacion'

  get '/bonoEducativo' => 'employees#bonoEducativo'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

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
  #       get 'sold'-
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
