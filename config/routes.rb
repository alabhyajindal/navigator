Rails.application.routes.draw do
  root to: 'dashboards#index'

  resources :users
  get 'signup', to: 'users#new'

end
