Rails.application.routes.draw do
  root to: 'locations#index'
  resources :users
  get "inbox", to: 'users#verify'
  get "login", to: "users#login"
  resources :locations
  get 'manage', to: 'locations#manage'
  get 'api/locations', to: 'locations#api_locations'
end
