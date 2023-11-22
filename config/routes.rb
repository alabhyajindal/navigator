Rails.application.routes.draw do
  root to: 'locations#index'
  resources :users
  resources :locations
  get 'manage', to: 'locations#manage'
  get 'api/locations', to: 'locations#api_locations'
end
