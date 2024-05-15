Rails.application.routes.draw do
  root 'pages#home'
  get '/home' => 'home#index'
  resources :users, only: [:create]
  
  # Define routes for login sessions
  get '/login', to: 'users#new'
  post '/login', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

  get '/pages/tictactoe', to: 'pages#tictactoe'
end
