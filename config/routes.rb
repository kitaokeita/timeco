Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'home/index'

  get 'home/show'

  root to: "home#index"
  resources :users, :only => [:index, :show]

  resources :tickets, shallow: true do
     resources :reservations
     resources :reviews
  end

  

 

	
 

 get "users/:id/useside" => "users#useside", as: 'useside'
  get "users/:id/lend" => "users#lend",  as: 'lend' 

 

end
