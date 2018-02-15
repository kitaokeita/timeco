Rails.application.routes.draw do
  get 'rooms/show'
  get 'rooms/index'

  get 'chat_messages/index'

  get 'users/index'

  get 'users/show'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'home/index'

  get 'home/show'
  get 'home/friend'
  

  root to: "home#index"
  resources :users do
    member do
     get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :tickets, shallow: true do
     resources :reservations
     resources :reviews
  end

resources :charges

get '/connect/oauth' => 'stripe#oauth', as: 'stripe_oauth'
get '/connect/confirm' => 'stripe#confirm', as: 'stripe_confirm'
get '/connect/deauthorize' => 'stripe#deauthorize', as: 'stripe_deauthorize'
get "users/:id/useside" => "users#useside", as: 'useside'
get "users/:id/lend" => "users#lend",  as: 'lend'

  
end