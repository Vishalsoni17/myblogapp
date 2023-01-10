Rails.application.routes.draw do
 # resources :blogs
# resources :blogs
resources :users do 
  resources :blogs
end
  get 'home/index'
  
 # get 'sessions/new'
 ## get 'sessions/destroy'
 # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
   root 'home#index'
resources :sessions, only: [:new, :create, :destroy]
get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'

  # Defines the root path route ("/")
  # root "articles#index"
end
