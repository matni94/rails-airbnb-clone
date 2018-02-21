Rails.application.routes.draw do
resources :users, only: [:show]
resources :spaces, only: [:new, :create, :show, :index] do
  resources :bookings, only: [:create]
end

resources :bookings, only: [] do
  resources :reviews, only: [:new, :create]
end

get "/dashboard", to: 'users#dashboard'


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
