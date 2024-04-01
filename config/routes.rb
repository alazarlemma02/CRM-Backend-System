# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'
      post '/auth/logout', to: 'authentication#logout'
      # get '/*a', to: 'application#not_found'
      get 'up' => 'rails/health#show', as: :rails_health_check
      resources :product_types
      resources :product_categories
      resources :product_quantity_types
      resources :products
      resources :users, param: :_username
      resources :user_feedbacks
      resources :roles
      resources :offerings
      resources :offer_types
      resources :communications
      resources :addresses
    end
  end
end
