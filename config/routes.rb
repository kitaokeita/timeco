Rails.application.routes.draw do
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

  

 

	
 

 get "users/:id/useside" => "users#useside", as: 'useside'
  get "users/:id/lend" => "users#lend",  as: 'lend' 

 

end
