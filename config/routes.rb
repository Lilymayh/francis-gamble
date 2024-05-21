Rails.application.routes.draw do

  resources :token_purchases, only: [:new, :create]

  get '/tokens' => 'token_purchases#new_token_purchase'
  post '/tokens' => 'token_purchases#create_token_purchase'

  root 'pages#home'

  get '/home', to: 'home#index'

  resources :users, only: [:create]

  

  get '/login', to: 'users#new'

  post '/login', to: 'users#create'

  delete '/logout', to: 'sessions#destroy'



  resources :tictactoe, only: [:create, :show, :update, :index, :new]



  get '/games', to: 'games#show', as: 'games_show'

  #get '/games/tictactoe', to: 'tictactoe#index', as: 'tictactoe_index'

  get '/games/tictactoe/:id', to: 'tictactoe#show', as: 'tictactoe_show'



  get '/games/checkers', to: 'checkers#show', as: 'checkers_show'

end