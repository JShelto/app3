Crunchmate::Application.routes.draw do

  root :to => "recipes#index"

  resources :users 
  resources :sessions, only: [:new, :create, :destroy]

  match '/home' => "recipes#index"

  match 'auth/:provider/callback' => 'sessions#create'

  get '/recipes/search', to: 'recipes#search'
  get '/recipes/:id/' => 'recipes#show'

  match '/signup' => 'users#new'
  match '/signin' => 'sessions#new'
  match '/signout' => 'sessions#destroy'

end
