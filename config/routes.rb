Rails.application.routes.draw do
  # generated routes
  resources :orders
  resources :items
  resources :grocery_lists
  resources :users
  resources :sessions
  
  # login and user routes
  get 'user/edit', to: 'users#edit', as: :edit_current_user
  get 'signup', to: 'users#new', as: :signup
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout
  
  # semi-static routes
  get 'home', to: 'home#index', as: :home
  get 'my_orders', to: 'orders#my_orders', as: :my_orders
  get 'accept_order/:id', to: 'orders#accept_order', as: :accept_order
  get 'shopping', to: 'orders#shopping', as: :shopping
  
  # set the root URL
  root to: 'sessions#new'
end
