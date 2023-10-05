Rails.application.routes.draw do
  root to: 'dashboards#index'

  resources :users
  get 'signup', to: 'users#new'

  resources :sessions, only: [:new, :create, :destroy]
  get 'signin', to: 'sessions#new'
end
