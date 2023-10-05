Rails.application.routes.draw do
  root to: 'dashboards#index'
  get '/dashboard', to: 'dashboards#show'

  resources :users
  get 'signup', to: 'users#new'

  resource :session, only: [:new, :create, :destroy]
  get 'signin', to: 'sessions#new'
end
