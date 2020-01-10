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
      get 'novel'
      get 'management'
      get 'economy'
      get 'finance'
      get 'it'
      get 'motivation'
      get 'talent'
      get 'etc'
      get 'reread_timing'
      get 'timing_knowledge'
      get 'timing_motivation'
      get 'timing_decision'
      get 'timing_stress'
      get 'timing_feel_down'
      get 'timing_lost_love'
      get 'timing_diversion'
      get 'timing_relax'
      get 'all_books'
      get 'read_books'
      get 'will_read_books'
      get 'follow_book'
    end
  end
  resources :books, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :impressions
    collection do
      get 'search'
    end
    member do
      get 'follow_book_show'
    end
  end
end
