Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :omniauth_callbacks => "omniauth_callbacks"}
  resources :pages, only: [:index]
  resources :states, only: [:index]
  resources :events, only: [:index, :show]

  get 'oauth_connect' => "users#oauth_connect", as: :oauth_connect
  post 'oauth_create' => "users#oauth_create", as: :oauth_create
  patch 'oauth_update' => "users#oauth_update", as: :oauth_update

  get 'yes' => "pages#yes", as: :yes
  get 'no' => "pages#no", as: :no

  get 'account' => 'users#edit', as: :account
  get 'friends' => 'users#friends', as: :user_root
  patch 'account' => "users#update", as: :user

  root :to => 'pages#home'
end
