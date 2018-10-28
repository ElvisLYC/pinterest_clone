Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/signup" => "users#new", as: "signup"
  post '/users' => 'users#create'

  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: "logout"

  root :to => "welcome#index"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "posts/search" => 'posts#search', as: 'search'
  get "posts/ajax_search" => 'posts#ajax_search', as: 'ajax_search'
  get "posts/random" => 'posts#random', as: 'random'
  post "/posts/:id" => 'votes#create', as: 'create_vote'
  post "/posts/:id" => 'posts#unvote', as: 'destroy_vote'
  resources :posts
  resources :votes

end
