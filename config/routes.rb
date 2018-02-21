Rails.application.routes.draw do
devise_for :users
resources :users, only: [:show]
resources :spaces, only: [:new, :create, :show, :index, :edit] do
  resources :bookings, only: [:create]
end

resources :bookings, only: [] do
  resources :reviews, only: [:new, :create]
end

get "/dashboard", to: 'users#dashboard'


  root to: 'spaces#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
