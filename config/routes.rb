Eggs::Application.routes.draw do
    resources :goods_services do
      member do
        get 'search_connections'
      end
    end

    get "profile", to: "goods_services#profile"
    get "users", to: "goods_services#users"
    get "friend", to: "goods_services#friend"
  
    root :to => redirect('/goods_services')
  end
  