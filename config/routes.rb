Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users
  get 'home/index'

  get 'home/show'

  root to: "home#index"
  resources :users, :only => [:index, :show]

  resources :tickets, shallow: true do
     resources :reservations
  end

  

 

	
 

 get "users/:id/useside" => "users#useside", as: 'useside'
  get "users/:id/lend" => "users#lend",  as: 'lend' 
 

end
