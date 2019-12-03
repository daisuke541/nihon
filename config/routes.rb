Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get "/" => "blogs#index" # 一覧画面

get 'articles/new' => 'blogs#new' # 投稿画面

post 'create' => 'blogs#create' # 投稿機能

get "articles/:id" => "articles#show"

get "articles/:id/edit" => "articles#edit" #　投稿編集

post "articles/:id/update" => "articles#update" #　投稿更新

post "articles/:id/destroy" => "articles#destroy" #　投稿削除

end
