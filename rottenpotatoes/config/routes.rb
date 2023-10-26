Rottenpotatoes::Application.routes.draw do
  resources :movies do
    member do
      get 'search_directors'
    end
  end

  root :to => redirect('/movies')
end
