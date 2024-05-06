Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      mount ActionCable.server => '/cable'
      post '/auth/login', to: 'authentication#login'
      post '/auth/logout', to: 'authentication#logout'
      post 'password/forgot', to: 'passwords#forgot'
      post 'password/reset', to: 'passwords#reset'
      # get '/*a', to: 'application#not_found'
      get 'up' => 'rails/health#show', as: :rails_health_check
      resources :product_types
      resources :product_categories
      resources :product_quantity_types
      resources :products do
        resources :product_feedbacks
      end
      resources :users do
        resources :messages
        resources :notifications
        post 'create_salesman', to: 'users#create_salesman', on: :collection
        post 'create_admin', to: 'users#create_admin', on: :collection
      end
      resources :user_feedbacks
      resources :roles
      resources :offerings
      resources :offer_types
      resources :addresses
    end
  end
end
