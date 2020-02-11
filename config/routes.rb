Rails.application.routes.draw do

  resources :meetings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "likes/:article_id/create" => "likes#create" # いいね

  post "likes/:article_id/destroy" => "likes#destroy" #いいね削除

  get "users/:id/likes" => "users#likes"

  get "login" => "users#login_form" #ログイン

  post "login" => "users#login" # ログインフォーム受け取り

  post "logout" => "users#logout" # ログアウト

  get 'users/index' => "users#index" #　ユーザー一覧

  post "users/create" => "users#create" #ユーザー作成

  get "users/signup" => "users#new" # ユーザー登録

  get "users/:id" => "users#show"

  get "users/:id/edit" => "users#edit"

  post "users/:id/update" => "users#update" # ユーザー更新

  # post "users/:id/destroy" => "users#destroy" #ユーザー削除


get "/" => "blogs#index" # 一覧画面

get 'articles/new' => 'articles#new' # 投稿画面

post 'create' => "articles#create" # 投稿機能

get "articles/:id" => "articles#show"

get "articles/:id/edit" => "articles#edit" #　投稿編集

post "articles/:id/update" => "articles#update" #　投稿更新

post "articles/:id/destroy" => "articles#destroy" #　投稿削除


end
