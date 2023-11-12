Eggs::Application.routes.draw do
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
  
    root :to => redirect('/goods_services')
  end
  