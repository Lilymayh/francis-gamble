Rails.application.routes.draw do
  root 'pages#home'
  get '/home' => 'home#index'
  resources :users, only: [:create]
end

