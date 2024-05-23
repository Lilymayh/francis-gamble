Rails.application.routes.draw do

  resources :token_purchases, only: [:new, :create]

  root 'pages#home'

  get '/home', to: 'home#index'

  resources :users, only: [:create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/register', to: 'users#create'

  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'


  resources :tictactoe, only: [:create, :show, :update, :index, :new] do
    post  'start', on: :collection
  end

  get '/tokens', to: 'token_purchases#new'
  post '/tokens', to: 'token_purchases#create'


  get '/games', to: 'games#show', as: 'games_show'
  #get '/games/tictactoe', to: 'tictactoe#index', as: 'tictactoe_index'
  get '/games/tictactoe/:id', to: 'tictactoe#show', as: 'tictactoe_show'
  get '/games/checkers', to: 'checkers#show', as: 'checkers_show'

  post 'subtract_balance', to: 'users#subtract_balance', as: :subtract_balance
  
end