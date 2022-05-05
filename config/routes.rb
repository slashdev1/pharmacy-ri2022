Rails.application.routes.draw do
  resources :orders
  resources :products
  resources :arrivals
  resources :prescriptions
  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
