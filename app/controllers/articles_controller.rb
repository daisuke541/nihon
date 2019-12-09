class ArticlesController < ApplicationController
def index
  @articles = Article.all
end

def show
  @article = Article.find_by(id: params[:id])
end

def new
  @article = Article.new
end

def create
  @article = Article.new(content: params[:content])
  if @article.save
  flash[:notice] = "投稿を作成しました"
  redirect_to("/")
else
  render("articles/new")
end
end

def edit
  @article = Article.find_by(id: params[:id])
end

def update
  @article = Article.find_by(id: params[:id])
  @article.content = params[:content] #name属性でparamsに代入されupdateアクションに送られる。値をparams[:content]で受け取り、投稿内容の更新をする。
  if @article.save
    flash[:notice] = "投稿を編集しました"
    redirect_to("/")
  else
    render("articles/edit")
  end
end

def destroy
  @article = Article.find_by(id: params[:id])
  @article.destroy
  flash[:notice] = "投稿を削除しました"
  redirect_to("/")
end


end
