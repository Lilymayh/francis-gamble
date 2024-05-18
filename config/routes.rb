Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/tokens' => 'token_purchases#new_token_purchase'
  post '/tokens' => 'token_purchases#create_token_purchase'

  get '/games/checkers', to: 'checkers#show'
  root 'pages#home'
  get '/home' => 'home#index'
  resources :users, only: [:create]
  
  # Define routes for login sessions
  get '/login', to: 'users#new'
  post '/login', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

  get '/pages/tictactoe', to: 'pages#tictactoe'
end
