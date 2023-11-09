Rails.application.routes.draw do
  devise_for :users

  root to: "posts#index"

  post 'posts', to: 'posts#create'

  delete 'posts/:id', to: 'posts#destroy'

  put 'posts/:id', to: 'posts#update'




  post 'images', to: 'images#create'




  get 'posts/:post_id/comments', to: 'comments#index'

  put 'posts/comments/:comment_id', to: 'comments#update'

  delete 'posts/comments/:comment_id', to: 'comment#destroy'

  post 'posts/comments', to: 'comments#create'




  post 'posts/likes', to: 'likes#create'
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
