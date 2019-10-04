Rails.application.routes.draw do
  resources :users
  resources :orders
  resources :sessions
  resources :complains

  # Main page
  root 'home#index'

  #get 'orders', to: 'orders#index', as: 'orders'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
