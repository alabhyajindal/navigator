Rails.application.routes.draw do
  root to: 'locations#index'

  resources :users
  get 'signup', to: 'users#new'

  resource :session, only: [:new, :create, :destroy]
  get 'signin', to: 'sessions#new'

  resources :locations
  get 'manage', to: 'locations#manage'
end
