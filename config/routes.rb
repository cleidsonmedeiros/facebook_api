Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'



  ##Root
  
  root to: "posts#index"



  ##POSTS

  post 'posts', to: 'posts#create'

  delete 'posts/:post_id', to: 'posts#destroy'

  put 'posts/:post_id', to: 'posts#update'



  ##COMMENTS

  get 'posts/:post_id/comments', to: 'comments#index'

  put 'posts/comments/:comment_id', to: 'comments#update'

  delete 'posts/comments/:comment_id', to: 'comment#destroy'

  post 'user/:user_id/posts/:post_id/comments', to: 'comments#create'



  ##LIKES

  get 'posts/:post_id/likes', to: 'likes#likes_count_post'

  get 'posts/:post_id/comments/:comment_id/likes', to: 'likes#likes_count_comment'

  post 'user/:user_id/posts/:post_id/likes', to: 'likes#liked_post'

  post 'user/:user_id/posts/:post_id/comments/:comment_id/likes', to: 'likes#liked_comment'
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
