Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/tokens' => 'token_purchases#new_token_purchase'
  post '/tokens' => 'token_purchases#create_token_purchase'

  get '/games/checkers', to: 'checkers#show'
end
