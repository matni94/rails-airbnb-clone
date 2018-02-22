Rails.application.routes.draw do
devise_for :users
resources :users, only: [:show]
resources :spaces, only: [:index, :new, :create, :show,  :edit] do
  resources :bookings, only: [:create]
end

resources :bookings, only: [] do
  resources :reviews, only: [:new, :create]
end

get "/dashboard", to: 'users#dashboard'
get "/dashboard/profile", to: 'users#profile'


root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
