Rails.application.routes.draw do

  get '/tokens' => 'token_purchases#new_token_purchase'
  post '/tokens' => 'token_purchases#create_token_purchase'

end
