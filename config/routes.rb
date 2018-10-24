Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/signup" => "users#new", as: "signup"
  post '/users' => 'users#create'

  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: "logout"

  root :to => "welcome#index"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :posts

end
