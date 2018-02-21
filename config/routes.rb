Rails.application.routes.draw do
resources :spaces do
end

  devise_for :users
  root to: 'spaces#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
