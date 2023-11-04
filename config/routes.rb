Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :recipes
  # recipes search
  get 'search', to: 'recipes#search'
  get 'search_result', to: 'recipes#search_result'
  # recipes bulk create
  post 'bulk_create', to: 'recipes#bulk_create'
  get 'bulk_create_index', to: 'recipes#bulk_create_index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
end
