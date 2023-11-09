Rails.application.routes.draw do
  devise_for :users

  root to: "posts#index"

  post 'posts', to: 'posts#create'

  delete 'posts/:post_id', to: 'posts#destroy'

  put 'posts/:post_id', to: 'posts#update'




  post 'images', to: 'images#create'

  delete 'images/:image_id', to: 'images#destroy'




  get 'posts/:post_id/comments', to: 'comments#index'

  put 'posts/comments/:comment_id', to: 'comments#update'

  delete 'posts/comments/:comment_id', to: 'comment#destroy'

  post 'posts/comments', to: 'comments#create'




  post 'user/:user_id/posts/:post_id/likes', to: 'likes#create'

  delete 'user/:user_id/posts/:post_id/likes', to: 'likes#destroy'
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
