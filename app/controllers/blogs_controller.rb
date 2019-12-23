class BlogsController < ApplicationController

  def index
    @article = Article.all.order(created_at: :desc)
    @article = Article.all.page(params[:page])

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(content: params[:content],
    title: params[:title],day: params[:day])
    if @article.save
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
