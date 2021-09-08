Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about', as: :about
  get 'profile/:id', to: "pages#profile", as: :profile
  resources :users, only: [:index] do
    member do
      post :follow
      post :unfollow
    end
  end
  resources :events, only: %i[index show create update destroy] do
    resources :bookings, only: %i[create destroy update]
    member do
      post 'toggle_favorite', to: "events#toggle_favorite"
    end
  end
  resources :chatrooms, only: %i[index show create] do
    resources :messages, only: :create
  end
end
