Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :omniauth_callbacks => "omniauth_callbacks"}
  resources :pages, only: [:index]
  resources :states, only: [:index]
  resources :events, only: [:index, :show]
  resources :cars
  resources :ride_requests

  post 'ride_requests/submit' => "ride_requests#submit", as: :ride_request_submit

  get 'oauth_connect' => "users#oauth_connect", as: :oauth_connect
  post 'oauth_create' => "users#oauth_create", as: :oauth_create
  patch 'oauth_update' => "users#oauth_update", as: :oauth_update

  get 'yes' => "pages#yes", as: :yes
  get 'no' => "pages#no", as: :no

  get 'account' => 'users#edit', as: :account
  get 'friends' => 'users#friends', as: :user_root
  get 'rides' => 'users#rides', as: :rides
  patch 'account' => "users#update", as: :user

  get 'events/:id/create_ride' => 'cars#new', as: :create_ride
  get 'events/:id/request_ride' => 'passengers#new', as: :create_passenger

  post 'cars/:id/accept' => 'cars#accept', as: :car_accept

  root :to => 'pages#home'
end
