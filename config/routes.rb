Rails.application.routes.draw do
  devise_for :users

  root to: "posts#index"

  post 'posts', to: 'posts#create'

  delete 'posts/:id', to: 'posts#destroy'

  put 'posts/:id', to: 'posts#edit'






  post 'images', to: 'images#create'

  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
