Rails.application.routes.draw do

  resources :token_purchases, only: [:new, :create]

  root 'pages#home'

  get '/home', to: 'home#index'

  resources :users, only: [:create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :tictactoe, only: [:create, :show, :update, :index, :new] do
    post 'start', on: :collection
  end

  get '/tokens', to: 'token_purchases#new'
  post '/tokens', to: 'token_purchases#create'

  get '/games', to: 'games#show', as: 'games_show'
  get '/games/tictactoe/:id', to: 'tictactoe#show', as: 'tictactoe_show'
  get '/games/checkers', to: 'checkers#show', as: 'checkers_show'

  post 'subtract_balance', to: 'users#subtract_balance', as: :subtract_balance
  
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

end
