Horoscope::Application.routes.draw do
  
  get 'home/all_users'
  


  root to: 'home#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :weathers, only: [:index]

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/weather',  to: 'weathers#index'
  match '/profile', to: 'users#index'
  match '/all_users', to: 'home#all_users'
end