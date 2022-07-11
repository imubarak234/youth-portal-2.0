Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  get '/home', to: 'home#index'

  get '/dashboard', to: 'dashboard#index'

  get '/review', to: 'review#index'

  resources :users, only: [:index, :new, :create, :show]
  resources :members
  resources :groups
end