Rails.application.routes.draw do
  get 'about/index'
  devise_for :users
  resources :users
  resources :orders
  resources :products
  resources :arrivals
  resources :prescriptions
  get 'home/index'

  root 'home#index'

  match '*unmatched', to: 'application#route_not_found', via: :all
end
