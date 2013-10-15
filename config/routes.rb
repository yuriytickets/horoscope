Horoscope::Application.routes.draw do
  
  get "weathers/index"

  root to: 'home#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :weathers, only: [:index]

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/weather',  to: 'weathers#index'

end