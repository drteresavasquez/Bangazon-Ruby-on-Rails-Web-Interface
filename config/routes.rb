Rails.application.routes.draw do
  resources :images
  resources :wish_lists
  resources :orders
  resources :payment_types
  resources :favorites
  resources :products_votes
  resources :categories
  resources :users
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
