# config/routes.rb
Eggs::Application.routes.draw do
    resources :goods_services

    resources :goods_services do
        member do
        get 'search_connections'
        end
    end

    resources :profile do
        member do
        get 'search_connections'
        end
    end

  get "users", to: "profile#users"

  resources :users, only: [:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]

  get 'sign_up', to: 'users#new', as: :new_user_registration
  get 'login', to: 'sessions#new', as: :new_user_session
 
  post 'sign_up', to: 'users#create', as: :user_registration
  post 'login', to: 'sessions#create', as: :user_session

  delete '/logout', to: 'sessions#destroy', as: 'logout'

  root to: 'application#index'
end
