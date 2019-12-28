Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :signup, only: [:new, :create]
  resources :books, only: [:new, :create]
  resources :users, only: [:index]
end
