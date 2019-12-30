Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :signup, only: [:new, :create]
  resources :users, only: [:index]
  resources :books, only: [:new, :create, :show] do
    resources :impressions, only: [:new, :create]
  end
end
