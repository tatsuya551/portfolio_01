Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :signup, only: [:new, :create] do
    collection do
      get 'logout'
    end
  end
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get 'category'
    end
  end
  resources :books, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :impressions
  end
end
