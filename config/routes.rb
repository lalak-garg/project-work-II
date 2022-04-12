Rails.application.routes.draw do
  devise_for :users, :skip => [:registration]
  root "home#index"
  resources :home
  resources :items
  resources :orders
  resources :customers
  resources :sellers do
    resources :products
  end
end
