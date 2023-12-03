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
  
    resource :session, only: [:new, :create, :destroy]
    resource :registration, only: [:new, :create, :destroy]

    get 'sign_up', to: 'users#new', as: :new_user_registration
    get 'login', to: 'sessions#new', as: :new_user_session
  
    root to: 'application#index'

  end
  