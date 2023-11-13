Eggs::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :goods_services do
    member do
      get 'search_connections'
    end
  end

  get 'profile', to: 'goods_services#profile'

  root to: 'application#index'
end
