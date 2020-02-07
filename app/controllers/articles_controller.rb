class ArticlesController < ApplicationController


before_action :authenticate_user,{only:[:edit, :update, :destroy]}

def new
  @article = Article.new
end

def create
  @article = Article.new(content: params[:content],
  title: params[:title],day: params[:day],user_id: @current_user.id
)
if @article.save
  flash[:notice] = "投稿を作成しました"
  redirect_to("/")
else
  render("articles/new")
end
end

def show
  @article = Article.find_by(id: params[:id])
  @user = User.find_by(id: @article.user_id)
end

def edit
  @article = Article.find_by(id: params[:id])
end

def update
  @article = Article.find_by(id: params[:id])
  @article.content = params[:content] #name属性でparamsに代入されupdateアクションに送られる。値をparams[:content]で受け取り、投稿内容の更新をする。
  @article.title = params[:title]
  @article.day = params[:day]

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

def ensure_corrent_user
@article = Article.find_by(id: params[:id])
  if @article.user_id != current_user.id
    flash[:notice] = "権限がありません"
    redirect("/")
  end
end

private
def article_params
  params.require(:article).permit(:text, :content, :img, :remove_img)
end

end
