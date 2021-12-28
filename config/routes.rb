Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :posts, only: [:index, :show, :create]
  resources :likes, only: [:index]

  # get     'signup',       to: 'users#new'
  post    'signup',       to: 'users#create'
  # get     'login',        to: 'auth#new'
  post    'signin',        to: 'auth#create'
  # delete  'logout',       to: 'sessions#destroy'
end
