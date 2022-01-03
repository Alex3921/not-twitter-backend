Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users,     only: [:show]
  resources :posts,     only: [:show, :create]
  resources :likes,     only: [:index]
  resources :bookmarks, only: [:index, :create]
  resources :retweets,  only: [:create]
  
  get       '/profile', to: 'posts#profile'
  get       '/home',    to: 'posts#home'
  post      '/signup',  to: 'users#create'
  post      '/signin',  to: 'auth#create'
  # delete  'logout',       to: 'sessions#destroy'
end
