Rails.application.routes.draw do

  get '/tokens' => 'token_purchases#new_token_purchase'
  post '/tokens' => 'token_purchases#create_token_purchase'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
