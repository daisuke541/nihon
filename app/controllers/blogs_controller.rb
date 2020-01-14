class BlogsController < ApplicationController

  def index
    @articles = Article.page(params[:page]).per(10)
  end

  def new
    @article = Article.new
  end

  def create
    @articles = Article.new(content: params[:content],
    title: params[:title],day: params[:day])
    if @articles.save
    flash[:notice] = "投稿を作成しました"
    redirect_to("/")
  else
    render("articles/new")
  end
  end
   # def create
    #    Article.create(blog_params)
    # end
    # private
    #def blog_params
    #    params.permit(:title, :image, :content)
    # end



end
