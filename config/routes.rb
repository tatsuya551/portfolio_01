Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root "home#index"
  resources :signup, only: [:new, :create] do
    collection do
      get 'logout'
      get 'start_app'
    end
  end
  resources :users, only: [:show, :edit, :update] do
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
      get 'followings'
      get 'followers'
      get 'read_count_books'
      get 'read_history'
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resources :impressions
    collection do
      get 'search'
    end
    member do
      get 'follow_book_show'
    end
  end
end
