Rails.application.routes.draw do
  # Define routes for token purchases
  resources :token_purchases, only: [:new, :create]

  # Define routes for user management
  root 'pages#home'
  get '/home', to: 'home#index'
  resources :users, only: [:create]
  
  # Define routes for login sessions
  get '/login', to: 'users#new'
  post '/login', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

  # Route for the tic-tac-toe page
  #get '/pages/tictactoe', to: 'pages#tictactoe'

  get '/games', to: 'games#show', as: 'games_show'

  get '/games/tictactoe', to: 'tictactoe#show', as: 'tictactoe_show'

  # Define route for the checkers game
  get '/games/checkers', to: 'checkers#show', as: 'checkers_show'
end

