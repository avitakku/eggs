Rottenpotatoes::Application.routes.draw do
    resources :goods_services do
      member do
        get 'search_connections'
      end
    end
  
    root :to => redirect('/goods_services')
  end
  