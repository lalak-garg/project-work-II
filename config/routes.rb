Rails.application.routes.draw do
  devise_for :users, :skip => [:registration]
  root "home#index"
  resources :home
  resources :carts
  resources :customers
  resources :sellers do
    resources :products
  end

  resources :items, only: [:create, :destroy]

  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
end
