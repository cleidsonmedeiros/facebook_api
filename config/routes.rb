Rails.application.routes.draw do
  devise_for :users

  root to: "posts#index"

  post 'posts', to: 'posts#create'

  post 'images', to: 'images#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
