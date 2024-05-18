Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Define routes for token purchases
  get '/token_purchases/new', to: 'token_purchases#new', as: 'new_token_purchase'
  post '/token_purchases', to: 'token_purchases#create'

  # Define routes for user management
  root 'pages#home'
  get '/home', to: 'home#index'
  resources :users, only: [:create]
  
  # Define routes for login sessions
  get '/login', to: 'users#new'
  post '/login', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

  # Route for the tic-tac-toe page
  get '/pages/tictactoe', to: 'pages#tictactoe'

   # Define route for the checkers game
   get '/games/checkers', to: 'checkers#show', as: 'checkers_show'
end
